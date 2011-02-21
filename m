From: Liu Hui-R64343 <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH 0/3] Add MX51 basic DT support
Date: Mon, 21 Feb 2011 02:10:37 +0000
Message-ID: <2CF7613B9822A943BEF13EF7ACEC5BD114969F@039-SN1MPN1-003.039d.mgd.msft.net>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
	<4D5E8C74.4090004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <4D5E8C74.4090004-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi, Rob,

Best Regards,
Jason Liu


>-----Original Message-----
>From: Rob Herring [mailto:robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
>Sent: Friday, February 18, 2011 11:13 PM
>To: Liu Hui-R64343; Jeremy Kerr
>Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org; linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org;
>patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
>Subject: Re: [PATCH 0/3] Add MX51 basic DT support
>
>Jason,
>
>On 02/18/2011 02:12 AM, Jason Liu wrote:
>> This patchset adds FSL mx51 device tree support. This is based on
>>
>> git://git.secretlab.ca/git/linux-2.6 devicetree/test
>>
>> This patch has been tested on MX51 babbage board and can boot up
>> succesfully to linux console with DT enabled.
>>
>> Jason Liu (3):
>>    arm/dt: add basic mx51 device tree support
>>    arm/dt: add very basic dts file for babbage board
>
>This is clearly based on the initial version I wrote. Can you give me credit for
>it.

OK, Sure,
>
>>    serial/imx: parse from device tree support
>
>Jeremy Kerr wrote the initial version of this although it is quite heavily
>changed.

Yes,  Will add it to the commit log.
>
>Original versions are here:
>
>http://kernel.ubuntu.com/git?p=jk/dt/linux-
>2.6.git;a=shortlog;h=refs/heads/mx51
>
>Rob
