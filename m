From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/4] mailbox: mailbox-test: rename driver as generic test
 driver
Date: Fri, 12 Feb 2016 09:08:21 +0000
Message-ID: <20160212090821.GP20693@x1>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
 <1455210808-29395-2-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455210808-29395-2-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 11 Feb 2016, Sudeep Holla wrote:

> This mailbox-test driver was designed to be generic, so let's remove =
ST
> tag on it and make it generic.
>=20
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/mailbox/mailbox-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox=
-test.c
> index 684ae17dcf39..3813f6d9eba9 100644
> --- a/drivers/mailbox/mailbox-test.c
> +++ b/drivers/mailbox/mailbox-test.c
> @@ -348,7 +348,7 @@ static const struct of_device_id mbox_test_match[=
] =3D {
> =20
>  static struct platform_driver mbox_test_driver =3D {
>  	.driver =3D {
> -		.name =3D "mailbox_sti_test",
> +		.name =3D "mailbox_test",
>  		.of_match_table =3D mbox_test_match,
>  	},
>  	.probe  =3D mbox_test_probe,

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
