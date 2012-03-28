From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Schemas for device trees
Date: Wed, 28 Mar 2012 17:02:35 -0600
Message-ID: <20120328230235.98E0D3E0FC9@localhost>
References: <CAKON4OyW00PUX3-50GrMSa0RhXLHZX3abjQmVHHiYPY2DCN=mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKON4OyW00PUX3-50GrMSa0RhXLHZX3abjQmVHHiYPY2DCN=mw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 28 Mar 2012 10:55:15 -0400, "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I'm putting together a device tree for a new platform and when looking
> at the other trees everything is kind of chaotic in regards to the
> various subsystems.
> 
> Is the existing DT include mechanism powerful enough to describe
> generic fragments? And we're just missing the core fragments for
> generic SPI, MMC, audio, etc.

Yes, pretty much.  There is work going on now to define common
bus-specific bindings that can be used by all relevant drivers.

SPI is there
MMC is currently being discussed
audio is in progress

> 
> In the XML world you can make schemas that describe what is legally
> allowed in an XML document. Device trees don't seem to any any kind of
> schema mechanism describing what is and isn't legal to put in a tree.
> 
> Instead of recreating the entire world of schemas, has anyone looked
> at using XML schemas to define what is a valid device tree and then
> write a tool to validate the existing device trees?

Not that I know of.  dtc does minimal static validation of the output,
but it is not remotely enough.

> A neat feature of XML schemas is the ability to include fragment
> schemas. For example you'd have a base schema and then depending on
> the core processor bring in schema fragments for mmc, audio, spi, etc.
>  I still can't figure out the right way to put audio into a device
> tree.
> 
> Another example, the voltage-ranges attribute for a spi mmc slot.
> voltage-ranges = <3200 3400>; I had to go look at the source code for
> this attribute to determine what the legal ranges were. A validating
> schema would contain the legal ranges.
> 
> Aren't the files in Documentation/devicetree/bindings really just
> schemas written in English with no automated way of checking the DTS
> files against them?

Yes, they really are.  I've been thinking for a long time that it
would be much better to have a binding markup that can be parsed both
into human readable documentation and validation of device tree data.

Can you put together an example of what it would look like using the
xml schema?

g.
