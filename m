From: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] regulator: act8865: set correct number of regulators
 in pdata
Date: Sun, 29 Jun 2014 11:46:43 +0200
Message-ID: <20140629094642.GA13485@gmail.com>
References: <1403451105-31929-1-git-send-email-b.galvani@gmail.com>
 <1403451105-31929-3-git-send-email-b.galvani@gmail.com>
 <20140627160725.GQ23300@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140627160725.GQ23300-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 27, 2014 at 05:07:25PM +0100, Mark Brown wrote:
> On Sun, Jun 22, 2014 at 05:31:42PM +0200, Beniamino Galvani wrote:
> > When platform data is populated from DT all the regulators are
> > instantiated and the value of num_regulators should be the number of
> > all available regulators rather than the number of matched ones.
> 
> Could you go into more detail on your logic on this one please?  The
> platform data (and DT configuration) for regulators should be completely
> optional.

pdata contains an array of struct act8865_regulator_data and a
num_regulators field which should hold the number of elements in the
array, if I understand correctly.

So in the current code, when populating platform data from DT, there
is a mismatch between the number of elements that are put in the array
(ARRAY_SIZE(act8865_matches)) and the value of num_regulators, which
is set to the number of regulators found in the DT.

In case of missing regulator nodes in DT, pdata->regulators will be
populated with all the regulators but their init_data will be NULL.

Beniamino
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
