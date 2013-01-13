From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: PMU node location
Date: Sat, 12 Jan 2013 20:10:36 -0700
Message-ID: <50F225AC.6030407@wwwdotorg.org>
References: <50EEC672.5050405@monstr.eu> <50F18742.5070501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50F18742.5070501-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/12/2013 08:54 AM, Rob Herring wrote:
> On 01/10/2013 07:47 AM, Michal Simek wrote:
>> Hi Rob, Mark, Grant and others,
>>
>> I want to check with you the location of ARM pmu node
>> I see that
>> 1) highbank and dbx5x0 have it in soc node
>>
>> 2) vexpress and tegra have no main bus and pmu is in root like all
>> others devices.
>> (Any reason no to have main bus? Does it mean that there is no bus or
>> that all
>> devices are accessible?)
> 
> That seems really wrong in general. Any memory mapped device is on a bus
> of some kind. I'm not sure the reasoning. Perhaps Stephen can explain.

I saw no need to have add a bus node (there wasn't one before I started
touching DT on Tegra); the top-level of the DT represents the CPU's
entire view of the address space and has #address-cells/#size-cells, so
devices get probed there just fine, whether they're addressed MMIO
devices or not.
