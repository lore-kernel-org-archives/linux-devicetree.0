From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] regulator: fixed: use of_property_read_{bool|u32}()
Date: Mon, 26 May 2014 15:07:01 -0300
Message-ID: <CAOMZO5Dg-rU5qFSYJEK9h1PwuN6Y099LVjHWOqSwV0Ro6PxFTw@mail.gmail.com>
References: <201405252350.40402.sergei.shtylyov@cogentembedded.com>
	<20140526151958.GU22111@sirena.org.uk>
	<53837AEE.7030400@cogentembedded.com>
	<20140526175648.GG12304@sirena.org.uk>
	<53838184.9070401@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53838184.9070401-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 26, 2014 at 3:01 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:

>> By avoiding CCing lkml you avoided CCing the list where regulator
>> patches are discussed.  When using get_maintainers.pl you need to think
>> about what it's telling you.
>
>
>    The problem with LKML is that it's always suggested, even for the very
> minor patches that should not be of interest to the wide public. I'll keep
> in mind that the regulator patches are discussed on LKML.

Maybe a linux-regulator list would be helpful?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
