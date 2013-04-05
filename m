From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2 1/7] kbuild: create an "include chroot" for DT bindings
Date: Fri, 05 Apr 2013 11:06:34 -0500
Message-ID: <515EF68A.3020505@gmail.com>
References: <1365032098-22825-1-git-send-email-swarren@wwwdotorg.org>
 <515E09FA.1090408@gmail.com> <515E2257.4030607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <515E2257.4030607-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/04/2013 08:01 PM, Stephen Warren wrote:
> On 04/04/2013 05:17 PM, Rob Herring wrote:
>> On 04/03/2013 06:34 PM, Stephen Warren wrote:
>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> The recent dtc+cpp support allows header files and C pre-processor
>>> defines/macros to be used when compiling device tree files. These
>>> headers will typically define various constants that are part of the
>>> device tree bindings.
>>>
>>> The original patch which set up the dtc+cpp include path only considered
>>> using those headers from device tree files. However, most are also
>>> useful for kernel code which needs to interpret the device tree.
>>>
>>> In both the DT files and the kernel, I'd like to include the DT-related
>>> headers in the same way, for example, <dt-bindings/gpio/tegra-gpio.h>.
>>> That will simplify any text which discusses the DT header locations.
>>>
>>> Creating a <dt-bindings/> for kernel source to use is as simple as
>>> placing files into include/dt-bindings/.
>>>
>>> However, when compiling DT files, the include path should be restricted
>>> so that only the dt-bindings path is available; arbitrary kernel headers
>>> shouldn't be exposed. For this reason, create a specific include
>>> directory for use by dtc+cpp, and symlink dt-bindings from there to the
>>> actual location of include/dt-bindings/. For want of a better location,
>>> place this "include chroot" into the existing dts/ directory.
>>>
>>> arch/*/boot/dts/include/dt-bindings -> ../../../../../include/dt-bindings
>>>
>>> Some headers used by device tree files may not be useful to the kernel;
>>> they may be used simply to aid in constructing the DT file (e.g. macros
>>> to create a node), but not define any information that the kernel needs
>>> to share. These may be placed directly into arch/*/boot/dts/ along with
>>> the DT files themselves.
>>>
>>> Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Acked-by: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>
>>> Acked-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>> Grant, Rob, Michal, I'm hoping for acks or comments from you so this
>>> series can be placed into a topic branch in the arm-soc repo, for others
>>> to build on during the 3.10 kernel cycle. Thanks.
>>
>> Well, you have mine here and the rest looks fine, so add it to the others.
> 
> Rob,
> 
> I had originally hoped for this to go into an arm-soc branch so that a
> number of SoCs could convert to use the feature in the same release,
> hence I was looking for acks to let that happen.
> 
> However, it's too late in the 3.10 cycle now for that to happen. Can the
> series be applied to the DT tree instead; people can convert during the
> 3.11 cycle.

That is fine. Can you send me a pull request.

Rob
