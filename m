From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 8/9] ARM: dts: refresh dts file for arch mmp
Date: Wed, 6 Jun 2012 13:25:54 +0800
Message-ID: <CAN1soZx5BiY4kgt1EzbyFqRQOAYxkX9p2sNbrxZ-D=oocZuuRw@mail.gmail.com>
References: <1336134626-12262-1-git-send-email-haojian.zhuang@gmail.com>
 <1336134626-12262-9-git-send-email-haojian.zhuang@gmail.com>
 <87d35ezkm1.fsf@laptop.org> <201206060128.28167.arnd@arndb.de>
 <4FCEB694.8080904@firmworks.com>
 <CAN1soZykbTFGk=qAmzDe2qyQVVYBJpxcPYh6OzWyPxiBacJ-mg@mail.gmail.com>
 <4FCEE91F.1030308@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FCEE91F.1030308-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
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
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 6, 2012 at 1:22 PM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
> On 6/5/2012 4:35 PM, Haojian Zhuang wrote:
>>
>> On Wed, Jun 6, 2012 at 9:47 AM, Mitch Bradley<wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> =A0wrot=
e:
>>>
>>> On 6/5/2012 3:28 PM, Arnd Bergmann wrote:
>>>>
>>>>
>>>> On Tuesday 05 June 2012, Chris Ball wrote:
>>>>>
>>>>>
>>>>> Hi Haojian,
>>>>>
>>>>> On Fri, May 04 2012, Haojian Zhuang wrote:
>>>>>>
>>>>>>
>>>>>> Append mmp2 and pxa910 dts files. Update PXA168 dts files for irq,
>>>>>> timer, gpio components.
>>>>>
>>>>>
>>>>>
>>>>> The patch I'm replying to introduced a device tree for MMP2/Brownstone
>>>>> in 3.5-rc1. =A0We're looking at adopting the MMP2 device tree for the
>>>>> OLPC
>>>>> XO-1.75 board, and Mitch Bradley has some corrections to the device
>>>>> tree
>>>>> format that we'd like to make, appended below.
>>>>>
>>>>> You can see all of the files Mitch mentions at:
>>>>> http://dev.laptop.org/~wmb/mmp2-devicetree/
>>>>>
>>>>> Here's my proposal for what to do next:
>>>>> =A0* First, you choose one of the two forms that Mitch links to.
>>>>> =A0 =A0(Either "mmp2.dtsi" or "mmp2-flat.dtsi"; we have a weak prefer=
ence
>>>>> =A0 =A0for mmp2-flat.dtsi.)
>>>>
>>>>
>>>>
>>>> My preference would be towards mmp2.dtsi. I've recommended doing it
>>>> that way to other people, too.
>>>
>>>
>>> In most cases, I have found that exposing the full hierarchy is
>>> preferable.
>>> =A0For this specific SoC, which I have been working with for quite awhi=
le
>>> now,
>>> I haven't found any instance where exposing the AXI/APB levels buys you
>>> anything. =A0The hierarchy just adds clutter.
>>>
>>> That said, I don't feel strongly about it.
>>>
>> mmp2-brownstone.dts is too complex since both apb& =A0axi are imported.
>>
>> Could we only use flat structure in mmp2-brownstone.dts?
>
>
> See http://dev.laptop.org/~wmb/mmp2-devicetree/mmp2-brownstone-flat.dts
> <http://dev.laptop.org/%7Ewmb/mmp2-devicetree/mmp2-brownstone-flat.dts>
>

My meaning is mmp2-brownstone-flat.dts + mmp2.dtsi. Is it acceptable?
