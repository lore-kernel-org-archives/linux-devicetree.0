From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Thu, 31 Oct 2013 15:11:15 -0600
Message-ID: <5272C773.2030901@wwwdotorg.org>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org> <20131025232951.GD17659@voom.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131025232951.GD17659-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/25/2013 05:29 PM, David Gibson wrote:
> On Thu, Oct 24, 2013 at 10:51:28PM +0100, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> This is a very quick proof-of-concept re: how a DT schema checker
>> might look if written in C, and integrated into dtc.

>> diff --git a/schemas/schema.c b/schemas/schema.c

>> +int schema_check_node(struct node *node)
...
>> +	if (!best_checker) { +		printf("WARNING: no schema for node
>> %s\n", node->fullpath); +		return 0; +	} + +	printf("INFO: Node
>> %s selected checker %s\n", node->fullpath, +
>> best_checker->name); + +	best_checker->checkfn(node);
> 
> IMO, thinking in terms of "the" schema for a node is a mistake. 
> Instead, think in terms of a bunch of schemas, which "known" what 
> nodes they're relevant for.  Often that will be determined by 
> compatible, but it could also be determined by other things
> (presence of 'interrupts', parent node, explicitly implied by
> another schema).

I don't agree here.

Each node represents a single specific type of object, and the
representation uses a single specific overall schema.

I'll admit that sometimes that schema is picked via the compatible
value (most cases), and other times via the node name/path (e.g.
/chosen, /memory).

In particular, I don't think it's correct to say that e.g. both a
"Tegra I2C controller" schema and an "interrupt" schema apply equally
to a "Tegra I2C DT node". Instead, I think that the "interrupt" schema
only applies because the "Tegra I2C controller" schema happens to
inherit from, or aggregate, the "interrupt" schema.

I see two important results from this distinction:

1) We should only allow properties from the "interrupt" schema to
exist within a node /if/ the top-level schema for the node actually
does make use of the "interrupt" schema". This is important since it
disallows e.g.:

                battery: smart-battery@b {
                        compatible = "ti,bq20z45", "sbs,sbs-battery";
                        reg = <0xb>;
                        interrupt-parent = <&gpio>;
                        interrupts = <5 4>;
                };

... since the ti,bq20z45/sbs,sbs-battery don't actually have an
interrupt output (assuming that the current binding doc for that
compatible value accurately reflects the HW here anyway).

If we allowed the "interrupt" schema to match the node simply because
it saw an "interrupts" property there, that'd allow this unused
property to exist in the DT, whereas we really do want to throw an
error here, so the DT author is aware they made a mistake.

2) Some inheritance or aggregation of schemas is parameterized, e.g.
on property name. For example, GPIO properties are named ${xxx}-gpios.
However, I don't believe there's any hard rule that absolutely
mandates that an /unrelated/ property cannot exist that matches the
same naming rule. Admittedly, it would be suboptimal if such a
conflicting property name were used, but if there's no hard rule
against it, I don't think we should design our schema checker to
assume that.

If the GPIO schema checker simply searched for any properties named
according to that pattern, it might end up attempting to check
properties that weren't actually generic GPIO specifiers. Instead, I'd
prefer the node's top-level schema to explicitly state which
properties should be checked according to which inherited schema(s).

In particular, perhaps this conflict could occur in a slightly generic
binding for a series of similar I2C GPIO expander chips, some of which
have 4 GPIOs and others 8. Someone might choose a "count-gpios" or
"number-of-gpios" property to represent that aspect of the HW.

So overall, I believe it's actually very important to first determine
*the* exact schema for a node, then apply that one top-level checker,
with it then invoking various (potentially parameterized) sub-checkers
for any inherited/aggregated schemas.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
