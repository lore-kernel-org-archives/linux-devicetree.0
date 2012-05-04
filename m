From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: mmp: support DT in irq
Date: Fri, 4 May 2012 11:41:15 +0800
Message-ID: <CAN1soZwE7MoifmxtPS8f_x6CrK-dF97=vPMTMStg=VW1wsoLrA@mail.gmail.com>
References: <1335515957-1798-1-git-send-email-haojian.zhuang@gmail.com>
 <20120427190620.D3C313E0B4D@localhost>
 <CAN1soZz5b0bc10isc6syxM7WzKfvVqc-HzotW6Auqv1A1mnC9A@mail.gmail.com>
 <201205021251.16967.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201205021251.16967.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 2, 2012 at 8:51 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Wednesday 02 May 2012, Haojian Zhuang wrote:
>> I use two CONFIG_OF in this file. The first one is used to record
>> register base address
>> of interrupt controller. In legacy code, the register address is
>> hardcoding. Do you mean
>> that I should remove this CONFIG_OF?
>
> Unless it's a noticeable performance impact, I would recommend just
> always using the mmp_icu_base variable, even for when CONFIG_OF is
> disabled.
>
> =A0 =A0 =A0 =A0Arnd

But I appended new irq handler for DT support. I still need to reserve
this CONFIG_OF
since I need to keep compatible with legacy code. While everything in
arch-mmp is moved
into DT, I can remove this CONFIG_OF.

For the second CONFIG_OF, I can try to remove it.

Best Regards
Haojian
