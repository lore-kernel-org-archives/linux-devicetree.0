From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/5] of: Only call notifiers when node is attached
Date: Thu, 6 Nov 2014 14:33:29 +0200
Message-ID: <EE6F3801-A76A-4D95-B841-A7935FA7FCF9@konsulko.com>
References: <1414528433-9650-1-git-send-email-pantelis.antoniou@konsulko.com> <1414528433-9650-4-git-send-email-pantelis.antoniou@konsulko.com> <20141105213925.3790BC41C40@trevor.secretlab.ca>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141105213925.3790BC41C40-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pete Popov <pete.popov-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Dan Malek <dan.malek-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Georgi Vlaev <georgi.vlaev@konsulko>
List-Id: devicetree@vger.kernel.org

Hi Grant,

> On Nov 5, 2014, at 23:39 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
>=20
> On Tue, 28 Oct 2014 22:33:51 +0200
> , Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> wrote:
>> Make sure we call notifier only when the node is attached.
>> When a detatched tree is being constructed we do not want the
>> notifiers to fire at all.
>=20
> The description does not match what the patch does. The patch moves t=
he
> test into of_{add,remove,update}_property() and out of
> of_property_notify() itself. That leaves one other caller of
> of_property_notify(); __of_changeset_entry_notify(). The effect of th=
is
> patch is that applying a changeset will cause notifiers to be fired f=
or
> each property modified in a changeset. The comment says nothing about
> the change in behaviour and it sounds like it is a bug fix when it
> doesn't actually change the behaviour at all for the
> of_{add,remove,update}_property() paths.
>=20
> This needs a better changelog. It needs to describe what the effects =
of
> the patch are and why the change is being made. When someone is
> bisecting a problem and they land on this change, the changelog needs=
 to
> give them a good idea about what is going on and why.
>=20

Valid points. In fact I performed some tests and with this reverted thi=
ngs
still work.

The rationale behind this is for when nodes/properties are removed in t=
he overlay,
but since we don=E2=80=99t support this for now, we never hit the case =
where it was
needed.

Please remove from the patch series, I=E2=80=99ll revisit this when I a=
dd the removal
functionality.

> g.
>=20

Regards

=E2=80=94 Pantelis

>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> ---
>> drivers/of/base.c    | 9 ++++++---
>> drivers/of/dynamic.c | 5 +----
>> 2 files changed, 7 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 2305dc0..a79d4ee 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -1695,7 +1695,8 @@ int of_add_property(struct device_node *np, st=
ruct property *prop)
>>=20
>> 	mutex_unlock(&of_mutex);
>>=20
>> -	if (!rc)
>> +	/* only call notifiers if the node is attached and no error occurr=
ed */
>> +	if (of_node_is_attached(np) && !rc)
>> 		of_property_notify(OF_RECONFIG_ADD_PROPERTY, np, prop, NULL);
>>=20
>> 	return rc;
>> @@ -1754,7 +1755,8 @@ int of_remove_property(struct device_node *np,=
 struct property *prop)
>>=20
>> 	mutex_unlock(&of_mutex);
>>=20
>> -	if (!rc)
>> +	/* only call notifiers if the node is attached and no error occurr=
ed */
>> +	if (of_node_is_attached(np) && !rc)
>> 		of_property_notify(OF_RECONFIG_REMOVE_PROPERTY, np, prop, NULL);
>>=20
>> 	return rc;
>> @@ -1830,7 +1832,8 @@ int of_update_property(struct device_node *np,=
 struct property *newprop)
>>=20
>> 	mutex_unlock(&of_mutex);
>>=20
>> -	if (!rc)
>> +	/* only call notifiers if the node is attached and no error occurr=
ed */
>> +	if (of_node_is_attached(np) && !rc)
>> 		of_property_notify(OF_RECONFIG_UPDATE_PROPERTY, np, newprop, oldpr=
op);
>>=20
>> 	return rc;
>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
>> index f297891..8e8b614 100644
>> --- a/drivers/of/dynamic.c
>> +++ b/drivers/of/dynamic.c
>> @@ -90,10 +90,6 @@ int of_property_notify(int action, struct device_=
node *np,
>> {
>> 	struct of_prop_reconfig pr;
>>=20
>> -	/* only call notifiers if the node is attached */
>> -	if (!of_node_is_attached(np))
>> -		return 0;
>> -
>> 	pr.dn =3D np;
>> 	pr.prop =3D prop;
>> 	pr.old_prop =3D oldprop;
>> @@ -138,6 +134,7 @@ int of_attach_node(struct device_node *np)
>> 	__of_attach_node_sysfs(np);
>> 	mutex_unlock(&of_mutex);
>>=20
>> +	/* node is guaranteed to be attached at this point */
>> 	of_reconfig_notify(OF_RECONFIG_ATTACH_NODE, np);
>>=20
>> 	return 0;
>> --=20
>> 1.7.12
>>=20
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
