From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Schemas for device trees
Date: Wed, 28 Mar 2012 22:17:04 -0400
Message-ID: <CAKON4OyuU_M_DEAoqs9tRrHZEDu6GfSt+Sm7-qY8na_VSB4iUw@mail.gmail.com>
References: <CAKON4OyW00PUX3-50GrMSa0RhXLHZX3abjQmVHHiYPY2DCN=mw@mail.gmail.com>
 <20120328230235.98E0D3E0FC9@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120328230235.98E0D3E0FC9@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Check out the XML schema stuff but another possibility is simply
writing our own schema validation tools based on the existing DT
syntax.  What device trees really need is a schema language, how we
achieve it doesn't really matter.  A custom Perl app might be better
in the Linux kernel world than verbose XML which is aimed web authors.

The device tree gods would get together and develop this schema. The
rest of us would have to author device trees that validate against
this schema. If we can't make our hardware fit we would need to ask
for changes to be made to the master schema. No more rolling your own
DT syntax, everything would have to validate in order to be accepted
into the kernel.  The schema is going to codify all of those English
language bindings files.

----------------------------------------------------------

There is quite a bit to the XML schema language. A decent tutorial
covering the highlights is here:
http://www.w3schools.com/schema/schema_intro.asp

You can do everything in text files, but there are also GUI tools for
developing the schemas like XSD in Eclipse. XML schemas have been
around for about ten years and their use is widespread on the Internet
so there are lots of tools for working on them.

Two pieces are needed.

1) A fairly simple tool that converts DT syntax into XML.  This is
just a straight forward mapping. I don't think there is anything in DT
syntax that can't be mapped straight into XML.

2) Schemas that are probably authored in a XML schema GUI of some kind
(like Eclipse XSD).  These can get big and complex but just use a GUI
tool to work on them. These schemas describe the possible valid device
trees. Schemas can include other schemas, which lets you collect the
various subsystems together.

Once you have these two pieces you run a validation program than
compares the XML version of the DT to the schema.  It will kick out
errors. You probably already have a validator installed, try
'xmllint'.

The reference schema needed for validation can be kept in a specially
formatted comment at the top of the DTS file or we can modify the
device tree compiler to explicitly allow it.
/* xsi:schemaLocation="http://www.w3schools.com note.xsd" */
The schemas are commonly kept on a web sever and are fetched as
needed. Doing it that way makes it easy to change them and keep
everyone up to date.

Piece of a simple schema:

<xs:element name="note">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="to" type="xs:string"/>
      <xs:element name="from" type="xs:string"/>
      <xs:element name="heading" type="xs:string"/>
      <xs:element name="body" type="xs:string"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>

Describes data like this:

<note>
<to>Joe</to>
<from>Bill</from>
</note>

If you feed it this, you'd get a validation error.

<note>
<author>Joe</author>
<from>Bill</from>
</note>


-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
