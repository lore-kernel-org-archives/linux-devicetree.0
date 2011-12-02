From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 05/14] tegra: fdt: Add Tegra2x device tree file
Date: Fri, 02 Dec 2011 08:58:25 -0700
Message-ID: <4ED8F5A1.1010408@nvidia.com>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>	<1322106896-23054-6-git-send-email-sjg@chromium.org>	<4ED3D975.4090903@nvidia.com>
 <CAPnjgZ11cFm15E9MHXno_YGp0NxdOHhGBavYbQBP5Nu_TOtx7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPnjgZ11cFm15E9MHXno_YGp0NxdOHhGBavYbQBP5Nu_TOtx7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/01/2011 06:24 PM, Simon Glass wrote:
> Hi Stephen,
> 
> On Mon, Nov 28, 2011 at 10:56 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On 11/23/2011 08:54 PM, Simon Glass wrote:
>>> This was taken from commit 1ea6b8f at:
>>> git://git.kernel.org/pub/scm/linux/kernel/git/olof/tegra.git
>>
...
>> In particular, linux-next now includes a minimal USB binding. Should we
>> just use this in U-Boot for now? We should get review on the kernel
>> lists before bringing in this more advanced USB binding in U-Boot, and
>> perhaps even add the binding into the kernel at the same time?
> 
> I copied my email to the device-tree mailing list. Hopefully that is
> enough to get a review there. It feels wrong to send U-Boot patches to
> the kernel list...?

I think the kernel and U-boot need to co-ordinate on the DT bindings.
Posting at least to linux-tegra, the Tegra maintainers, and perhaps even
the kernel's domain-specific list (i.e. linux-usb) seems appropriate to
me. DT is a cross-functional thing, and really needs cross-functional
discussion and review. devicetree-discuss will cover the DT experts, but
probably not the CPU and subsystem experts.

-- 
nvpublic
