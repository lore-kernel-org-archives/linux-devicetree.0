From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for
	extendinginformation from included dts files
Date: Fri, 15 Oct 2010 13:32:43 -0600
Message-ID: <AANLkTinPWv94Xoz+mDxiE=KujQYAyQj9PsPWHEORypJ3@mail.gmail.com>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<d223e561-ed6e-44c2-8a99-8959e85ae022@VA3EHSMHS031.ehs.local>
	<20101014004550.GC4456@yookeroo>
	<21eeaef0-fc78-47c9-b1c5-bfefaa55fb85@SG2EHSMHS003.ehs.local>
	<20101015151840.GB32705@angua.secretlab.ca>
	<b04d95cc-c35b-4597-8fbe-f7c48f23ef92@VA3EHSMHS036.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <b04d95cc-c35b-4597-8fbe-f7c48f23ef92-+Ck8Kgl/v09DUMyIFHz4objjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 15, 2010 at 10:10 AM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>
>
>> -----Original Message-----
>> From: Grant Likely [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Grant
> Likely
>> Sent: Friday, October 15, 2010 8:19 AM
>> To: Stephen Neuendorffer
>> Cc: David Gibson; John Bonesio; devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: Re: Proposal: new device-tree syntax and semantics for
> extendinginformation from included dts
>> files
>>
>> On Thu, Oct 14, 2010 at 09:38:44AM -0700, Stephen Neuendorffer wrote:
>> [fixed quoting header]
>> > On Wed, Oct 13, 2010 5:46 PM, David Gibson wrote:
>> > > On Wed, Oct 13, 2010 at 04:41:59PM -0700, Stephen Neuendorffer
> wrote:
>> > > [snip]
>> > > > Or better yet, outside of the braces?
>> [...]
>> > > > =A0 =A0 =A0 =A0 =A0 =A0 /remove/ {
>> > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 se=
rial@2600 { };
> // PSC4
>> > > >
>> > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 se=
rial@2800 { };
> // PSC5
>> > > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
>> > >
>> > > Um.. no. =A0That makes even less sense in the conceptual framework
> of a
>> > > stack of overlays.
>> >
>> > Why exactly? =A0Instead of being a stack of overlays, it seems to me
> like
>> > a stack of trees with operators..
>> > The point is exactly that operators make most sense at the stack of
>> > trees level and not
>> > at the individual node level.
>>
>> I don't think I'm understanding what you're trying to say. =A0How do you
> differentiate "stack of
>> overlays" and "stack of trees"?
>>
>> The reason I don't like this approach is that in many cases many
>> things will need to be changed by a single overlay, and not all those
>> changes will be the same operation. =A0For example, an overlay for a
>> board could add a bunch of nodes for i2c devices, and at the same time
>> remove an unused spi bus device.
>
> So why not have two trees stacked to do the job?

Umm, isn't the suggestion currently on the table?

>> The "stack of overlays" conceptual model that we've settled on uses
>> the concept that subsequent top level trees stack on top of the
>> preceding tree and can mask out or add/change nodes and properties.
>> The trees are merged together before going on to the next top level
>> tree.
>>
>> g.
>>
>
> I guess I'm stuck on 'overlay' to me implies '/extend/', so I associate
> the operations being on trees, not individual nodes.
> (Although, there's still the tough part about /remove-node/ vs
> /remove-property/,
> which might meant that the operations have to be in the trees to
> distinguish that).

Yes, the operations would need to be on the individual nodes; whether
operating on the top level node, or on one of the child nodes.  I
think some examples are in order....

Just for argument, I'm going to assume that we define two new
keywords; /trim-property/ and /trim-node/.  The sole purpose of
/trim-property/ is to remove a property.  /trim-node/ can be used
either to either remove or replace a node.  We can still argue about
the name and the ordering, but the principle remains the same.

Example 1: using full tree overlay
---------
The following .dts file:

	/ {
		the-red: red {
			rgb =3D <255 0 0>;
		};
		the-blue: blue {
			rgb =3D <0 0 255>;
			favourite-colour;
		};
		the-green: green {
			rgb =3D <0 255 0>;
		};
	};

	/ {
		blue {
			rgb =3D <0 0 127>;
			/trim-property/ favourite-color;
		};

		/trim-node/ green;

		/trim-node/ red {
			vendor =3D "Benjamin Moore"
		};
	};

This example uses only one overlay tree.  It removes (trims) the
'favourite-colour' property from the blue node.  It removes the
green node outright, and it replaced the red node.

Would be collapse to:

	/ {
		the-red: red {
			vendor =3D "Benjamin Moore"
		};
		the-blue: blue {
			rgb =3D <0 0 127>;
		};
	};

Example 2: using label references
---------
The following .dts file:

	/ {
		the-red: red {
			rgb =3D <255 0 0>;
			firebrick {
				rgb =3D <178 34 34>;
			};
		};
		the-blue: blue {
			rgb =3D <0 0 255>;
			favourite-colour;
		};
		the-green: green {
			rgb =3D <0 255 0>;
		};
	};

	&the-red {
		rgb =3D <127 0 0>;
		pink {
			rgb =3D <255 192 203;
		};
		/trim-node/ firebrick {
			ugly-colour;
		};
	};

	/trim-node/ &the-blue;

	/trim-node/ &the-green {
		shade =3D "radioactive slime"
	};

This example uses three overlay trees.  The first overlay
modified the node pointed to by the label "the-red". It changes the
rgb property, it adds a 'pink' node, and it *replaces* the firebrick
node (by using both the /trim-node/ keyword and a set of { }  braces).

The second removes the node pointed to by "the-blue".

The third replaces the node pointed to by "the-green".

This tree collapses to:

	/ {
		the-red: red {
			rgb =3D <127 0 0>;
			pink {
				rgb =3D <255 192 203>;
			};
			firebrick {
				ugly-colour;
			};
		};
		green {
			shade =3D "radioactive slime"
		};
	};

The /trim-node/ keyword in this model is valid at both the top level
and inside a node.  Properties can never be defined at the top level,
so /trim-property/ only makes sense inside a node.

g.
