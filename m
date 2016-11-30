From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: Re: Overlays and boolean properties
Date: Wed, 30 Nov 2016 09:29:22 +0000
Message-ID: <5f4b9a49-8e63-5542-b00a-f415d2b4af6d@raspberrypi.org>
References: <a02487bb-6f79-fe4d-8180-86375b9413b9@raspberrypi.org>
 <BDABA9C0-FDBE-4B2E-97AE-D3684D2A68BA@konsulko.com>
 <20161130034733.GH19891@umbus>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161130034733.GH19891@umbus>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi David,

On 30/11/2016 03:47, David Gibson wrote:
> On Tue, Nov 29, 2016 at 03:10:40PM +0200, Pantelis Antoniou wrote:
>> Hi Phil,
>>
>>> On Nov 29, 2016, at 15:06 , Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> wrote:
>>>
>>> Boolean properties are defined as being properties with no content, that
>>> are true if present and false if absent. They pose a problem for DT
>>> overlays, since the proposed (and widely used) overlay mechanism does
>>> not allow for properties (or nodes) to be deleted; overlays can only
>>> make a false property true, so boolean properties are effectively
>>> monostable - once true they become immutable.
>>>
>>> The standard DT syntax includes /delete-property/ and /delete-node/
>>> directives that do what you would expect from their names, but that
>>> facility is not available to overlays. There is no FDT node that
>>> represents the deletion - the directives are acted on immediately
> Uh.. only partially true.  They're acted on during the compile run,
> but not during the parse.  dtc does have an internal representation of
> node or property deletions that gets resolved when we combine the
> fragments in the source file.
>>> - so
>>> we would need some extra markup - say __delete_property__ and
>>> __delete_node__ - to hold the names of items to be deleted.
> So, in principle this wouldn't be that hard - we'd just need to
> translate dtc's internal representation into a representation in the
> dtb.  That could be done with special properties, or with new opcodes
> at the dtb encoding level.
>
>>> Before I take this further, does anybody have any thoughts on the idea?
> So.. the first question, is do we have a pressing use case for this?
> dtbos can (apart from this) alter anything in a base tree, but doing
> so isn't often a good idea.  Usually they'll just add new nodes and
> properties.

This is more of a real world example than a pressing use case, since the
number of people affected is small and there is workaround, albeit an
ugly one.

The Raspberry Pi SoCs have two SD interfaces - one SDIO-capable and one
not. On the Pi3B the SDIO-capable interface is used to drive the WiFi
interface. This WiFi interface doesn't like being continuously prodded
to see if it is still there, so the base DTB sets the "non-removable"
boolean property. Not all Pi3 users want WiFi, preferring instead to
wire up an MMC device or second SD slot via the expansion header. A DT
overlay allows them to modify the pin functions to achieve this, but the
overlay can't (easily) remove the aptly-named "non-removable". The ugly
workaround is to disable the original MMC node and create a clone with a
different name and without the unwanted property.

>> The original patchset did support removing properties (by prefixing them with -).
>>
>> I can revive that if we have consensus about the format/method.
> On the whole, I'd prefer not to see extensions of the existing overlay
> format - instead I'd like to see focus on a new and better thought out
> connector format.
Will this connector mechanism allow a populated DT to be modified, or
would you always have to start with an "empty" board and only add that
which you want? I like the flexibility to be able to perform arbitrary
DT modifications (except deletions) - it has been very useful for
testing and performing staggered rollouts of new functionality.

Phil
