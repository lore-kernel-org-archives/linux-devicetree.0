From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH v2 8/9] ARM: dts: refresh dts file for arch mmp
Date: Wed, 06 Jun 2012 06:22:57 -1000
Message-ID: <4FCF83E1.9060000@firmworks.com>
References: <1336134626-12262-1-git-send-email-haojian.zhuang@gmail.com>
 <1336134626-12262-9-git-send-email-haojian.zhuang@gmail.com>
 <87d35ezkm1.fsf@laptop.org> <201206060128.28167.arnd@arndb.de>
 <4FCEB694.8080904@firmworks.com>
 <CAN1soZykbTFGk=qAmzDe2qyQVVYBJpxcPYh6OzWyPxiBacJ-mg@mail.gmail.com>
 <4FCEE91F.1030308@firmworks.com>
 <CAN1soZx5BiY4kgt1EzbyFqRQOAYxkX9p2sNbrxZ-D=oocZuuRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAN1soZx5BiY4kgt1EzbyFqRQOAYxkX9p2sNbrxZ-D=oocZuuRw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 6/5/2012 7:25 PM, Haojian Zhuang wrote:
> ...
>
>>> mmp2-brownstone.dts is too complex since both apb&    axi are imported.
>>>
>>> Could we only use flat structure in mmp2-brownstone.dts?
>>
>>
>> See http://dev.laptop.org/~wmb/mmp2-devicetree/mmp2-brownstone-flat.dts
>> <http://dev.laptop.org/%7Ewmb/mmp2-devicetree/mmp2-brownstone-flat.dts>
>>
>
> My meaning is mmp2-brownstone-flat.dts + mmp2.dtsi. Is it acceptable?
>

No, you must use mmp2-brownstone.dts with mmp2.dtsi .  The position of 
the uart , twsi, and rtc nodes must agree in both cases.

Do you have a use case where exposing the AXI and APB bus levels is helpful?
