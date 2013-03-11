From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/2] hwmon: NTC: add IIO get channel and read support
Date: Mon, 11 Mar 2013 14:36:45 -0700
Message-ID: <CAD=FV=WedkZdqrob=pvmdr_FD27xtX=riEc5rdiTS3QVPk22SA@mail.gmail.com>
References: <1362967787-22557-1-git-send-email-ch.naveen@samsung.com>
	<1362967787-22557-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1362967787-22557-2-git-send-email-ch.naveen@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lm-sensors@lm-sensors.org, devicetree-discuss@lists.ozlabs.org, Jean Delvare <khali@linux-fr.org>, Guenter Roeck <linux@roeck-us.net>, Naveen Krishna <naveenkrishna.ch@gmail.com>, dg77.kim@samsung.com
List-Id: devicetree@vger.kernel.org

Naveen,

On Sun, Mar 10, 2013 at 7:09 PM, Naveen Krishna Chatradhi
<ch.naveen@samsung.com> wrote:
> @@ -317,7 +346,7 @@ static int ntc_thermistor_get_ohm(struct ntc_data *data)
>                 return data->pdata->read_ohm(data->pdev);
>
>         if (data->pdata->read_uV) {
> -               read_uV = data->pdata->read_uV(data->pdev);
> +               read_uV = data->pdata->read_uV(data->pdata);

This doesn't apply for me.  Did you perhaps accidentally send up a
patch against the version of the driver that's in the Chrome OS tree?
You should be sending patches against some tree that's upstream
(linux, linux-next, iio, ...).

Thanks!

-Doug
