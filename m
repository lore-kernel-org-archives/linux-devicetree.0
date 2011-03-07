From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] serial/imx: parse from device tree support
Date: Mon, 7 Mar 2011 13:08:10 +0800
Message-ID: <AANLkTik2CG=4xwkkO46is41bQhsSM5oSovPBoyusFJG9@mail.gmail.com>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
	<1298016730-22761-4-git-send-email-r64343@freescale.com>
	<AANLkTind79cPhBoSbGZsVodYRRk4dEQpr4G-Zf19yi7G@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <AANLkTind79cPhBoSbGZsVodYRRk4dEQpr4G-Zf19yi7G-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Arnd, Shawn,

On Mon, Feb 28, 2011 at 6:35 PM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 18 February 2011 16:12, Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>> =A0drivers/tty/serial/imx.c | =A0 81 +++++++++++++++++++++++++++++++++++=
+++++------
>> =A01 files changed, 71 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
>> old mode 100644
>> new mode 100755
>
> The file mode was changed to have 'x'?

Thanks for the review comments and I will come up with V2 patch soon.

BR,
Jason

>
> --
> Regards,
> Shawn
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>
