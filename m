From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/9] ARM: mmp: distinguish mmp and mmp2 in Kconfig
Date: Wed, 2 May 2012 13:53:12 +0800
Message-ID: <CAN1soZy=OdS=GUc93mgJ0bXTLJSX3+=WuWT=0yLDxkgjjG=wgQ@mail.gmail.com>
References: <1335515957-1798-1-git-send-email-haojian.zhuang@gmail.com>
 <1335515957-1798-3-git-send-email-haojian.zhuang@gmail.com>
 <201204272014.49443.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201204272014.49443.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 28, 2012 at 4:14 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 27 April 2012, Haojian Zhuang wrote:
>> Append four CONFIG_* MACRO to distinguish boards in arch-mmp.
>>
>> CONFIG_MMP_LEGACY and CONFIG_MMP2_LEGACY are used to support boards
>> without device tree.
>>
>> CONFIG_MMP_DT and CONFIG_MMP2_DT are used to support boards with
>> device tree.
>>
>> At the same time, only one of these four macro could be selected.
>> It's used to miss compiling all boards file together.
>
> Can you explain why this is done? It seems counterintuitive to
> have the DT and non-DT support be mutually exclusive.
>
If I selected DT support, I needn't select those machine support one
by one. I want to use
mmp-dt to support all PXA168/PXA910 boards, and use mmp2-dt to support
all mmp2 boards.
So I use exclusive statements in Kconfig for convenience.

Thanks
Haojian
