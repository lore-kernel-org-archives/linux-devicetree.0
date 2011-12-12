From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 10/14] tegra: usb: Add support for USB peripheral
Date: Mon, 12 Dec 2011 11:18:50 -0700
Message-ID: <4EE6458A.5090203@nvidia.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>	<1322106896-23054-11-git-send-email-sjg@chromium.org>	<4ED3DF1D.6080009@nvidia.com>	<CAPnjgZ1-yxq-O-vsy1gNJ8AOzh7Sz9j5PG9Tx1sKpnAxhApJAQ@mail.gmail.com>	<4EDD38AC.30908@nvidia.com>	<CAPnjgZ0MTaPa4pq1VXk_XbmuDyWTfy-H33W4deNVn2ALUrcW_A@mail.gmail.com>	<4EDD429E.8010507@nvidia.com>	<CAPnjgZ2G220G-i3PPtS4XJYY0ornWFOoK3=b93jG-6GE_g2O5w@mail.gmail.com>	<4EDD5F1B.5060205@nvidia.com>	<CAPnjgZ2h7F228q=pXuf7M9vTASurY3R5an_QV-mrETLf8nzA1A@mail.gmail.com>	<4EDE7E1C.2090203@nvidia.com>	<CAPnjgZ1G+mv6uv8SrdMm7DoqFjeeyVHYv6nbQxn9qixfbQMGvA@mail.gmail.com>	<4EDFFAC5.5070002@nvidia.com>
 <CAPnjgZ0AuBNkYKN0JHQyc7DdzwUSZivR+Dv2BkiFsKQBNMeP8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ0AuBNkYKN0JHQyc7DdzwUSZivR+Dv2BkiFsKQBNMeP8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Remy Bohmer <linux-SYUVB/VFmdasTnJN9+BGXg@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/08/2011 02:24 PM, Simon Glass wrote:
> On Wed, Dec 7, 2011 at 3:46 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 12/06/2011 02:23 PM, Simon Glass wrote:
...
>> I think the best implementation would be to enumerate everything solely
>> based on compatible flags, and allowing "usb start" to accept either an
>> alias name (which would be fixed) or a DT unit address or node name
>> (which would be fixed) or a controller index (which might vary based on
>> enumeration order) to select the controller.
>>
>> The next best implementation would be to enumerate solely based on
>> compatible flags, then sort the list based on alias, thus allowing alias
>> to cause a static order.
>>
>> However, enumerating based on alias, then enumerating based on
>> compatible flags and adding any missing nodes would be fine.
> 
> Well ok. Since this is basically a small *addition* to the code
> (scanning things that don't have an alias), and will have no effect
> with the device tree as included in this series, I would like to do
> this as a follow-on patch after the series. I hope you can live with
> that also?

I suppose it'll have to do.

It's totally the wrong way to go about it though, and will provide a bad
example that'll probably end up proliferating itself through the code
since it's the first example.

In other words rather than:

Now: Scan /aliases for USB, add then all.

Later: Scan device nodes for any that weren't in /aliases, add them all

I'd prefer to see:

Now: Scan /aliases for USB, add then all.

Later: Remove all the /aliases scanning code, fix the code to scan all
child nodes of the SoC node, find all nodes matching the USB compatible
flag, add them all. While adding a USB controller, check the /alias node
and honor any alias there if there is one.

-- 
nvpublic
