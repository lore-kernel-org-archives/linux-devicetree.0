From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Thu, 27 Jul 2017 19:49:11 +0300
Message-ID: <1501174151.1055.8.camel@hp800z>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

This is a project I've been working on lately and it's finally in a
usuable form.

I'm introducing yamldt.

A YAML to DT blob generator/compiler, utilizing a YAML schema that is
functionaly equivalent to DTS and supports all DTS features.

yamldl parses a device tree description (source) file in YAML format and
outputs a (bit-exact if the -C option is used) device tree blob.

A DT aware YAML schema is a good fit as a DTS syntax alternative.

YAML is a human-readable data serialization language, and is expressive
enough to cover all DTS source features.

Simple YAML files are just key value pairs that are very easy to parse,
even without using a formal YAML parser. For instance YAML in restricted
environments may simple be appending a few lines of text in a given YAML
file.

The parsers of YAML are very mature, as it has been released in 2001. It
is in wide-spread use and schema validation tools are available. YAML
support is available for every major programming language.

Data in YAML can easily be converted to/form other format that a
particular tool that we may use in the future understands.

More importantly YAML offers (an optional) type information for each
data, which is IMHO crucial for thorough validation and checking against
device tree bindings (when they will be converted to a machine readable
format, preferably YAML).

For more take a look here.

https://github.com/pantoniou/yamldt

I am eagerly awaiting for your comments.

Regards

-- Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
