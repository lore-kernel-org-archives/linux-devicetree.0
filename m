From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] Add MX51 basic DT support
Date: Mon, 21 Feb 2011 16:17:50 +0800
Message-ID: <AANLkTinWF54qvgSc4MVjS4ONPb3upnwQ2YJzVxmePiH_@mail.gmail.com>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1298016730-22761-1-git-send-email-r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

On 18 February 2011 16:12, Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> This patchset adds FSL mx51 device tree support. This
> is based on
>
> git://git.secretlab.ca/git/linux-2.6 devicetree/test
>
> This patch has been tested on MX51 babbage board and can
> boot up succesfully to linux console with DT enabled.
>
Is this supposed to see console login prompt or just console?  I'm
seeing fec related nodes in babbage.dts, but I can not get fec up
running.  Did I miss anything or fec is not with this patch set yet?

-- 
Regards,
Shawn
