MIME-Version: 1.0
In-Reply-To: <1457044050-15230-15-git-send-email-peda@lysator.liu.se>
References: <1457044050-15230-1-git-send-email-peda@lysator.liu.se>
	<1457044050-15230-15-git-send-email-peda@lysator.liu.se>
Date: Thu, 17 Mar 2016 08:33:57 -0500
Message-ID: <CAL_JsqKbQpM+=Ajt528OmvYmmOCFv+JB--=FMe=84EosVWxSiA@mail.gmail.com>
Subject: Re: [PATCH v4 14/18] of/unittest: convert to use an explicit i2c mux core
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Peter Rosin <peda@lysator.liu.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, Peter Korsgaard <peter.korsgaard@barco.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, Adriana Reus <adriana.reus@intel.com>, Viorel Suman <viorel.suman@intel.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Terry Heo <terryheo@google.com>, Hans Verkuil <hans.verkuil@cisco.com>, Arnd Bergmann <arnd@arndb.de>, Tommi Rantala <tt.rantala@gmail.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 3, 2016 at 4:27 PM, Peter Rosin <peda@lysator.liu.se> wrote:
> From: Peter Rosin <peda@axentia.se>
>
> Allocate an explicit i2c mux core to handle parent and child adapters
> etc. Update the select op to be in terms of the i2c mux core instead
> of the child adapter.

This doesn't tell me why
>
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>  drivers/of/unittest.c | 40 +++++++++++++++-------------------------
>  1 file changed, 15 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
> index 979b6e415cea..a6dc4b18047e 100644
> --- a/drivers/of/unittest.c
> +++ b/drivers/of/unittest.c
> @@ -1687,13 +1687,7 @@ static struct i2c_driver unittest_i2c_dev_driver = {
>
>  #if IS_BUILTIN(CONFIG_I2C_MUX)
>
> -struct unittest_i2c_mux_data {
> -       int nchans;
> -       struct i2c_adapter *adap[];
> -};
> -
> -static int unittest_i2c_mux_select_chan(struct i2c_adapter *adap,
> -                              void *client, u32 chan)
> +static int unittest_i2c_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
>  {
>         return 0;
>  }
> @@ -1701,11 +1695,11 @@ static int unittest_i2c_mux_select_chan(struct i2c_adapter *adap,
>  static int unittest_i2c_mux_probe(struct i2c_client *client,
>                 const struct i2c_device_id *id)
>  {
> -       int ret, i, nchans, size;
> +       int ret, i, nchans;
>         struct device *dev = &client->dev;
>         struct i2c_adapter *adap = to_i2c_adapter(dev->parent);
>         struct device_node *np = client->dev.of_node, *child;
> -       struct unittest_i2c_mux_data *stm;
> +       struct i2c_mux_core *muxc;
>         u32 reg, max_reg;
>
>         dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
> @@ -1729,25 +1723,23 @@ static int unittest_i2c_mux_probe(struct i2c_client *client,
>                 return -EINVAL;
>         }
>
> -       size = offsetof(struct unittest_i2c_mux_data, adap[nchans]);
> -       stm = devm_kzalloc(dev, size, GFP_KERNEL);
> -       if (!stm) {
> -               dev_err(dev, "Out of memory\n");
> +       muxc = i2c_mux_alloc(adap, dev, 0, 0,
> +                            unittest_i2c_mux_select_chan, NULL);
> +       if (!muxc)
>                 return -ENOMEM;
> -       }
> -       stm->nchans = nchans;
> +       ret = i2c_mux_reserve_adapters(muxc, nchans);
> +       if (ret)
> +               return ret;
>         for (i = 0; i < nchans; i++) {
> -               stm->adap[i] = i2c_add_mux_adapter(adap, dev, client,
> -                               0, i, 0, unittest_i2c_mux_select_chan, NULL);
> -               if (!stm->adap[i]) {
> +               ret = i2c_mux_add_adapter(muxc, 0, i, 0);
> +               if (ret) {
>                         dev_err(dev, "Failed to register mux #%d\n", i);
> -                       for (i--; i >= 0; i--)
> -                               i2c_del_mux_adapter(stm->adap[i]);
> +                       i2c_mux_del_adapters(muxc);
>                         return -ENODEV;
>                 }
>         }
>
> -       i2c_set_clientdata(client, stm);
> +       i2c_set_clientdata(client, muxc);
>
>         return 0;
>  };
> @@ -1756,12 +1748,10 @@ static int unittest_i2c_mux_remove(struct i2c_client *client)
>  {
>         struct device *dev = &client->dev;
>         struct device_node *np = client->dev.of_node;
> -       struct unittest_i2c_mux_data *stm = i2c_get_clientdata(client);
> -       int i;
> +       struct i2c_mux_core *muxc = i2c_get_clientdata(client);
>
>         dev_dbg(dev, "%s for node @%s\n", __func__, np->full_name);
> -       for (i = stm->nchans - 1; i >= 0; i--)
> -               i2c_del_mux_adapter(stm->adap[i]);
> +       i2c_mux_del_adapters(muxc);
>         return 0;
>  }
>
> --
> 2.1.4
>
