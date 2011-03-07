From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] Add MX51 basic DT support
Date: Mon, 7 Mar 2011 13:03:17 +0800
Message-ID: <AANLkTikwx4ESFDRraRzJcaOuCTggfok4oMEx-kp-FYxc@mail.gmail.com>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
	<AANLkTinWF54qvgSc4MVjS4ONPb3upnwQ2YJzVxmePiH_@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <AANLkTinWF54qvgSc4MVjS4ONPb3upnwQ2YJzVxmePiH_-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

Hi, Shawn,

On Mon, Feb 21, 2011 at 4:17 PM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Jason,
>
> On 18 February 2011 16:12, Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> This patchset adds FSL mx51 device tree support. This
>> is based on
>>
>> git://git.secretlab.ca/git/linux-2.6 devicetree/test
>>
>> This patch has been tested on MX51 babbage board and can
>> boot up succesfully to linux console with DT enabled.
>>
> Is this supposed to see console login prompt or just console? =A0I'm
> seeing fec related nodes in babbage.dts, but I can not get fec up
> running. =A0Did I miss anything or fec is not with this patch set yet?

FEC is not support currently, I just use initramfs to boot kernel to consol=
e.

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
