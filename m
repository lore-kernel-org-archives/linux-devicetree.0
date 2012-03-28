From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Schemas for device trees
Date: Wed, 28 Mar 2012 10:55:15 -0400
Message-ID: <CAKON4OyW00PUX3-50GrMSa0RhXLHZX3abjQmVHHiYPY2DCN=mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

I'm putting together a device tree for a new platform and when looking
at the other trees everything is kind of chaotic in regards to the
various subsystems.

Is the existing DT include mechanism powerful enough to describe
generic fragments? And we're just missing the core fragments for
generic SPI, MMC, audio, etc.

In the XML world you can make schemas that describe what is legally
allowed in an XML document. Device trees don't seem to any any kind of
schema mechanism describing what is and isn't legal to put in a tree.

Instead of recreating the entire world of schemas, has anyone looked
at using XML schemas to define what is a valid device tree and then
write a tool to validate the existing device trees?

A neat feature of XML schemas is the ability to include fragment
schemas. For example you'd have a base schema and then depending on
the core processor bring in schema fragments for mmc, audio, spi, etc.
 I still can't figure out the right way to put audio into a device
tree.

Another example, the voltage-ranges attribute for a spi mmc slot.
voltage-ranges = <3200 3400>; I had to go look at the source code for
this attribute to determine what the legal ranges were. A validating
schema would contain the legal ranges.

Aren't the files in Documentation/devicetree/bindings really just
schemas written in English with no automated way of checking the DTS
files against them?

-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
