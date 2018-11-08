From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH anybus v3 6/6] misc: support HMS Profinet IRT industrial controller
Date: Thu, 8 Nov 2018 15:20:29 +0100
Message-ID: <CAK8P3a3apbxNa2FpADvdLCe-GzV+2xv2kO1_tosOZrUpY6xWtA@mail.gmail.com>
References: <20181104155501.14767-1-TheSven73@googlemail.com> <20181104155501.14767-7-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181104155501.14767-7-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thesven73@gmail.com
Cc: svendev@arcx.com, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, noralf@tronnes.org, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, gregkh <gregkh@linuxfoundation.org>, John Garry <john.garry@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, Stuart Yoder <stuyoder@gmail.com>, Maxime Ripard <maxime.r>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 4, 2018 at 4:55 PM <thesven73@gmail.com> wrote:

> +
> +struct msgEthConfig {
> +       u32 ip_addr, subnet_msk, gateway_addr;
> +} __packed;

The __packed attribute makes it slower to access but doesn't
change the layout, so better drop it.

> +struct msgMacAddr {
> +       u8 addr[6];
> +} __packed;
> +
> +struct msgStr {
> +       char    s[128];
> +} __packed;
> +
> +struct msgShortStr {
> +       char    s[64];
> +} __packed;
> +
> +struct msgHicp {
> +       char    enable;
> +} __packed;

The __packed on these ones has no effect, and can just be dropped
for readability.

> +static ssize_t mac_addr_show(struct device *dev,
> +                               struct device_attribute *attr,
> +                               char *buf)
> +{
> +       struct profi_priv *priv = dev_get_drvdata(dev);
> +       struct msgMacAddr response;
> +       int ret;
> +
> +       ret = anybuss_recv_msg(priv->client, 0x0010, &response,
> +                                               sizeof(response));
> +       if (ret)
> +               return ret;
> +       return snprintf(buf, PAGE_SIZE, "%02X:%02X:%02X:%02X:%02X:%02X\n",
> +               response.addr[0], response.addr[1],
> +               response.addr[2], response.addr[3],
> +               response.addr[4], response.addr[5]);
> +}
> +
> +static DEVICE_ATTR_RO(mac_addr);

> +static ssize_t ip_addr_show(struct device *dev,
> +                               struct device_attribute *attr,
> +                               char *buf)
> +{

I don't understand much about field bus, but I have a general feeling
that if you configure a mac address and IP address, this should
be connect ed to the network layer in some form, possibly being
exposed as a network device and manipulated using netlink
instead of sysfs or ioctl.

Can you explain how this fits together and why you got the the
sysfs interface?

> +struct ProfinetConfig {

The CamelCase naming seems odd here.

> +       struct {
> +               /* addresses IN NETWORK ORDER! */
> +               __u32 ip_addr;
> +               __u32 subnet_msk;
> +               __u32 gateway_addr;
> +               __u8  is_valid:1;
> +       } eth;

This is where packing might make sense, since you have
padding fields in a user space structure ;-) . It would be better
to just avoid the implicit padding though and name all fields.

Overall, this structure feels too complex for an ioctl interface,
with the nested structures. If we end up keeping that
ioctl, maybe at least make it a flat structure without padding,
or alternatively make it a set of separate ioctls.

      Arnd
