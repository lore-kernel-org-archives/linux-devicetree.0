From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: "memory" binding issues
Date: Wed, 18 Sep 2013 07:56:46 +1000
Message-ID: <1379455006.6148.0.camel@pasglop>
References: <1379300274.4098.77.camel@pasglop>
	 <1379371567.3721.46.camel@pasglop>
	 <CAOesGMgE1jiF5OHsmPQz2z66Bcqu0HeAj=taE1vmFK-0-0s2TQ@mail.gmail.com>
	 <1815499.tpfeUKmP6V@flatron> <20130917164307.GA31327@quad.lixom.net>
	 <5238C4D1.6060500@gmail.com>
	 <CAOesGMh0F09OAR4bepGSCE5Z5OZ56fBmDPBSfwZ+NB9RgcE0Vw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMh0F09OAR4bepGSCE5Z5OZ56fBmDPBSfwZ+NB9RgcE0Vw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Tue, 2013-09-17 at 14:15 -0700, Olof Johansson wrote:
> Sigh, that's horrible. OF clearly doesn't require it.

Doesn't it ?

All OF implementations will create it, you would have to explicitly
remove the encode-unit method of the parent to make it disappear...

All I can find in 1275 is:

<<
Some nodes in the device tree do not represent physical devices. These
system nodes are used instead for various
general firmware purposes. System nodes do not have physical addresses.
Their node names have a driver name
field but not a unit address field.
>>

That implies that such nodes also don't have a "reg" property (ie. "do
not have physical address").

I don't see anything else, if anything, the definition of the node name
seems to not have provisions for a missing unit address.

The only case in OF that I know where the unit address is not present is
wildcard nodes (also known as protocol nodes) which also don't have a
"reg" property such as used by some SCSI controllers when the fcode
doesn't want to probe the bus at boot and requires the unit address to
be explicitly passed in the "open" call. This is clearly not the case
here.

Or did I miss something ?

> I guess people prefer to follow ePAPR even though it's broken? That
> means someone needs to cleanup the current dts files. Any takers?

It's not broken. I don't understand why you are so adamant about
that :-)

Cheers,
Ben.



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
