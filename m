From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v6 1/2] DT: hwspinlock: Add binding documentation for
 Qualcomm hwmutex
Date: Thu, 16 Apr 2015 13:01:27 +0100
Message-ID: <20150416120127.GM2866@leverpostej>
References: <CA+bK7J6donXZvLqN2Fv_9dVYgj9j=xJAwmEEo86+XKZ4oj166A@mail.gmail.com>
 <CAK=WgbaAtBBNpf61rvO22TXq+6M6wk5jX1Cgxjqce8dXCJyigw@mail.gmail.com>
 <CA+bK7J6rXtF54Tp1+mkDbv8Hok88MVZeC+mLvjjGjzZ4KtTHEw@mail.gmail.com>
 <CAK=WgbZxZ0SUjZzBeqELZ=WQH5B5c41UCYc8_uHqOpgBtLVOfQ@mail.gmail.com>
 <CA+bK7J7OB2bbGna7y-O4egF-rhig-bdf1W5Uw+GG7F0VjDepUg@mail.gmail.com>
 <CAK=WgbYwk=DEgNFKn11BHpS=V_m=6Okf=i7w5NkLHwu8ryMaJg@mail.gmail.com>
 <CAJAp7OgZo8rUGL1xkrSVTXMZfgzbV8eGEMniSquw7owkRAqKmg@mail.gmail.com>
 <CAK=WgbauoPf52v3P7NLPsXaRUmGWo_K6ZcV4w3UO6xs7MUrJsw@mail.gmail.com>
 <CAK=WgbY-5OsfdKJxGScvGj5sv-M-UvxhCfgSTunHiufvq1PXEQ@mail.gmail.com>
 <CAL_Jsq+GhhhoHgRDOkK4=oWtSVmvw=UpLoU-Ey5M7tdNi5OZ2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+GhhhoHgRDOkK4=oWtSVmvw=UpLoU-Ey5M7tdNi5OZ2Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>, Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jeffrey Hugo <jhugo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> The part I'm not clear what the purpose of "pool-hwlock" was.

One use-case was a set of hwlocks having no fixed purpose, and being
available for dynamic allocation between the OS and other entities (e.g.
some RTOS on another core).

The set of locks forming a reusable pool, and any information associated
with them (e.g. the logical IDs used by the other entity) are a property
of that interface rather than the hwlock provider.

So you'd describe those pools of locks in some interface-specific
manner, consuming hwlocks from a set of hwlock providers.

Hopefully that doesn't maek things less clear...

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
