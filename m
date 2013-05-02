From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Thu, 02 May 2013 12:52:33 -0600
Message-ID: <5182B5F1.7090800@wwwdotorg.org>
References: <1365608728-30494-1-git-send-email-christian.ruppert@abilis.com>
 <516EEAA0.10906@wwwdotorg.org> <20130418090310.GA17636@ab42.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130418090310.GA17636-7oYq3qWSd+k@public.gmane.org>
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
To: Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Leuenberger <sascha.leuenberger-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>, Pierrick Hascoet <pierrick.hascoet-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/18/2013 03:03 AM, Christian Ruppert wrote:
> Dear Stephen and Linus,
> 
> I am responding to this message because it touches the core issue I was
> wondering about when integrating pinctrl with GPIO. I think all
> unrelated comments in your other messages are valid and will be
> addressed in the next iteration of both drivers.
> 
> On Wed, Apr 17, 2013 at 12:32:00PM -0600, Stephen Warren wrote:
>> On 04/10/2013 09:45 AM, Christian Ruppert wrote:
>>> The pinmux driver of the Abilis Systems TB10x platform based on ARC700 CPUs.
>>> Used to control the pinmux and is a prerequisite for the GPIO driver.
>>
>> Linus already did a review of this, but I have a few extra comments:
>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/abilis,tb10x-iomux.txt b/Documentation/devicetree/bindings/pinctrl/abilis,tb10x-iomux.txt
...
>> * A list of pins/groups to apply the settings to.
> 
> This is what the pingrp string refers to. We really don't want to expose
> Linux internal pin numbers!

I wasn't suggesting a particular naming/numbering scheme for the pins,
but simply that the document has to state what that naming/numbering
scheme is, so that people know how to fill in the DT. If the
naming/numbering scheme exactly matches some HW manual, then it should
be enough to say e.g. "see section X in Foo manual", to avoid
duplicating the information. If not, then the valid values should be
listed in the binding document.
