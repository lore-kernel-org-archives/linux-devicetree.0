From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v4] coresight: bindings for coresight drivers
Date: Thu, 21 Aug 2014 13:15:05 +0200
Message-ID: <53F5D4B9.5060305@suse.de>
References: <1408554698-24459-1-git-send-email-mathieu.poirier@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408554698-24459-1-git-send-email-mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 20.08.2014 19:11, schrieb mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org:
> From: Pratik Patel <pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>=20
> Coresight IP blocks allow for the support of HW assisted tracing
> on ARM SoCs.  Bindings for the currently available blocks are
> presented herein.
>=20
> Signed-off-by: Pratik Patel <pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Signed-off-by: Panchaxari Prasannamurthy <panchaxari.prasannamurthy@l=
inaro.org>
> Signed-off-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  .../devicetree/bindings/arm/coresight.txt          | 205 +++++++++++=
++++++++++
>  1 file changed, 205 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/coresight.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Do=
cumentation/devicetree/bindings/arm/coresight.txt
> new file mode 100644
> index 0000000..2ee594d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -0,0 +1,205 @@
> +* CoreSight Components
> +
> +CoreSight components are compliant with the ARM CoreSight architectu=
re
> +specification and can be connected in various topologies to suit a p=
articular
> +SoCs tracing needs. These trace components can generally be classifi=
ed as sinks,
> +links and sources. Trace data produced by one or more sources flows =
through the
> +intermediate links connecting the source to the currently selected s=
ink. Each
> +CoreSight component device should use these properties to describe i=
ts hardware
> +characteristcs.
> +
> +Required properties for all components *except* non-configurable rep=
licators:
> +
> +- compatible : name of the component used for driver matching.  Poss=
ible values
> +include: "arm,coresight-etb10", "arm,coresight-tpiu", "arm,coresight=
-tmc",
> +"arm,coresight-funnel", and "arm,coresight-etm3x".  All of these hav=
e to
> +be supplemented with "arm,primecell" as drivers are using the AMBA b=
us
> +interface.  Since non-configurable replicators don't show up on the =
AMBA
> +bus they don't need to be post-fixed with "arm,primecell".

I think this document would be much easier to read if you indented thes=
e
paragraphs below "name" here. That way the actual property names would
stand out more when looking up a particular property.

> +
> +- reg : physical base address and length of the register set(s) of t=
he component.
> +
> +- clocks : the clock associated to this component.
> +
> +- clock-names: the name of the clock as referenced by the code.  Sin=
ce we are
> +using the AMBA framework, the name should be "apb_pclk".
> +
> +- ports or port: The representation of the component's port layout u=
sing the
> +generic DT graph presentation found in "bindings/graph.txt".
> +
> +Non-configurable replicators:
> +
> +- compatible: currently supported value is "arm-replicator".  Since =
non-configurable
> +replicators don't show up on the AMBA hey don't need to be post-fixe=
d with
> +"arm,primecell".
> +
> +- id: a unique number that will identify this replicator.
> +
> +- ports or port: same as above.
> +
> +Optional properties for Sinks:
> +
> +- coresight-default-sink: must be specified for one of the sink devi=
ces that is
> +intended to be made the default sink. Other sink devices must not ha=
ve this
> +specified. Not specifying this property on any of the sinks is inval=
id.
> +
> +Optional properties for ETM/PTMs:
> +
> +- arm,cp14: must be present if the system accesses ETM/PTM managemen=
t registers
> +via co-processor 14.
> +
> +- arm,cp14: access to ETM/PTM management registers is made via cp14.
> +
> +- cpu: the cpu phandle this ETM/PTM is affined to. When omitted the =
source is
> +considered to belong to CPU0.
> +
> +Optional property for TMC:
> +
> +- arm,buffer-size: size of contiguous buffer space for TMC ETR (embe=
dded trace router)
> +
> +
> +Example:
> +
> +1. Sinks
> +	etb: etb@20010000 {
> +		compatible =3D "arm,coresight-etb10", "arm,primecell";
> +		reg =3D <0 0x20010000 0 0x1000>;

You seem to be using two address cells (and two size cells). In that
case, I believe I read it were convention to use etb@0,20010000?

Regards,
Andreas

> +
> +		coresight-default-sink;
> +		clocks =3D <&oscclk6a>;
> +		clock-names =3D "apb_pclk";
> +		port {
> +			etb_in_port: endpoint@0 {
> +				slave-mode;
> +				remote-endpoint =3D <&replicator_out_port0>;
> +			};
> +		};
> +	};
[snip]


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
