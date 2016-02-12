From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/4] mailbox: mailbox-test: fix the compatible string
Date: Fri, 12 Feb 2016 09:08:37 +0000
Message-ID: <20160212090837.GQ20693@x1>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
 <1455210808-29395-3-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455210808-29395-3-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 11 Feb 2016, Sudeep Holla wrote:

> Underscores are usually forbidden in the compatible strings. So lets
> remove it before the first users of this is seen.
>=20
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Acked-by: Lee Jones <lee.jones@linaro.org>

> ---
>  Documentation/devicetree/bindings/mailbox/sti-mailbox.txt | 2 +-
>  drivers/mailbox/mailbox-test.c                            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/sti-mailbox.tx=
t b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
> index b61eec920359..351f612673fc 100644
> --- a/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
> +++ b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
> @@ -44,7 +44,7 @@ Optional properties
>  Example:
> =20
>  mailbox_test {
> -	compatible	=3D "mailbox_test";
> +	compatible	=3D "mailbox-test";
>  	reg		=3D <0x[shared_memory_address], [shared_memory_size]>;
>  	mboxes		=3D <&mailbox2 0 1>, <&mailbox0 2 1>;
>  	mbox-names	=3D "tx",	"rx";
> diff --git a/drivers/mailbox/mailbox-test.c b/drivers/mailbox/mailbox=
-test.c
> index 3813f6d9eba9..036a852b5fa1 100644
> --- a/drivers/mailbox/mailbox-test.c
> +++ b/drivers/mailbox/mailbox-test.c
> @@ -342,7 +342,7 @@ static int mbox_test_remove(struct platform_devic=
e *pdev)
>  }
> =20
>  static const struct of_device_id mbox_test_match[] =3D {
> -	{ .compatible =3D "mailbox_test" },
> +	{ .compatible =3D "mailbox-test" },
>  	{},
>  };
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
