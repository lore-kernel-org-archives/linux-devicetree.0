From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] Add MX51 basic DT support
Date: Fri, 18 Feb 2011 09:12:52 -0600
Message-ID: <4D5E8C74.4090004@gmail.com>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
To: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jason,

On 02/18/2011 02:12 AM, Jason Liu wrote:
> This patchset adds FSL mx51 device tree support. This
> is based on
>
> git://git.secretlab.ca/git/linux-2.6 devicetree/test
>
> This patch has been tested on MX51 babbage board and can
> boot up succesfully to linux console with DT enabled.
>
> Jason Liu (3):
>    arm/dt: add basic mx51 device tree support
>    arm/dt: add very basic dts file for babbage board

This is clearly based on the initial version I wrote. Can you give me 
credit for it.

>    serial/imx: parse from device tree support

Jeremy Kerr wrote the initial version of this although it is quite 
heavily changed.

Original versions are here:

http://kernel.ubuntu.com/git?p=jk/dt/linux-2.6.git;a=shortlog;h=refs/heads/mx51

Rob
