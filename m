From: Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 4/4] arm64:numa: adding numa support for arm64
 platforms.
Date: Mon, 20 Oct 2014 15:30:46 +0100
Message-ID: <20141020143045.GA10233@linaro.org>
References: <1411635840-24038-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
 <1411635840-24038-5-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
 <20141003121343.GG26643@leverpostej>
 <CAFpQJXVJtn=PTYTd5icHhfYxsQnEzUP+w9kXXDJSs-M=eGNWVw@mail.gmail.com>
 <20141006112640.GF24686@leverpostej>
 <CAFpQJXU4AW_WycWUWWaONvCiFgJU5KC_coCH8EU9kO=a0Rf9hQ@mail.gmail.com>
 <CAFpQJXXkgtr6E0owHxAu0MG8+7s5LBt_mVB9gQM1VfkX2rY5FQ@mail.gmail.com>
 <20141020142555.GA9968@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141020142555.GA9968-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 20, 2014 at 03:25:56PM +0100, Steve Capper wrote:
> On Fri, Oct 17, 2014 at 10:49:56PM +0530, Ganapatrao Kulkarni wrote:

[...]

>          /*Proximity Distance matrix for 4Node system
> >                        <from-node to-node distance>
> >         */
> >          node-matrix=    <0 0 10>,
> >                                <0 1 20>,
> >                                <0 2 30>,
> >                                <0 3 10>,
> >                                <1 0 20>,
> >                                 <1 1 10>,
> >                                <1 2 30>,
> >                               <1 3 10>,
> >                               <2 0 30>,
> >                               <2 1 20>,
> >                               <2 2 10>,
> >                              <2 3 10>,
> >                             <3 0 10>,
> >                             <3 1 20>,
> >                             <3 2 30>,
> >                             <3 3 10>,
> >  }
> 
> Hi Ganapat,
> The above caught my attention.
> 
> For a 4-node system do we not need 16 distances; the implication of that
> would be that the distance between node A-B could be different from the
> distance between B-A? Also the distance from a node to itself could be
> safely assumed to be zero?
> 
> I think we should have a symmetric matrix with zero-diagonals so strictly
> only seven values would need specifying for a 4-node system.

s/seven/six/

I really need to learn how to count.... :-/

> 
> Cheers,
> -- 
> Steve
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
