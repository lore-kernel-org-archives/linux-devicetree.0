From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: Fwd: fdtdump and libfdt SEGV with corrupt file
Date: Wed, 13 Nov 2013 07:25:28 -0600
Message-ID: <E1VgaRk-0002fP-1X@jdl.com>
References: <CAFOYHZDmxB-EN9qG0B_tNK6XyQdLS_3G=_TGoo1psPKFi-Ht-A@mail.gmail.com> <CAFOYHZAVAWpaQnKMVD+EqV+FkvxzHbu-UxNqqQ6PExKd0a2Pyg@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAFOYHZAVAWpaQnKMVD+EqV+FkvxzHbu-UxNqqQ6PExKd0a2Pyg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <judge.packham-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> 
> P.S. Is there a tarball release for v1.4.0?
> http://www.jdl.com/software/ only goes up to v1.3.0.

Chris,

No pre-made tar file was made for 1.4.0.  However, you
may readily create your own by grabbing the Git repository
and using "git archive" on the tag.  Uh, the second
example on the man page, perhaps:

    $ git archive --format=tar --prefix=dtc-1.4.0/ v1.4.0 | gzip > dtc-1.4.0.tgz

HTH,
jdl

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
