From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH v2 2/4] Documentation: arm64/arm: dt bindings for numa.
Date: Wed, 10 Dec 2014 11:57:32 +0100
Message-ID: <10603826.6Z6KUoI9qZ@wuerfel>
References: <1416605010-10442-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com> <2065254.jRdQcinOdg@wuerfel> <54759991.50204@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54759991.50204-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Roy Franz <roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shannon Zhao <zhaoshenglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 26 November 2014 17:12:49 Hanjun Guo wrote:
> 
> Thanks for the detail information. I have the concerns about the distance
> for NUMA nodes, does the "ibm,associativity-reference-points" property can
> represent the distance between NUMA nodes?
> 
> For example, a system with 4 sockets connected like below:
> 
> Socket 0  <---->  Socket 1  <---->  Socket 2  <---->  Socket 3
> 
> So from socket 0 to socket 1 (maybe on the same board), it just need 1
> jump to access the memory, but from socket 0 to socket 2/3, it needs
> 2/3 jumps and the *distance* relative longer. Can
> "ibm,associativity-reference-points" property cover this?
> 

Hi Hanjun,

I only today found your replies in my spam folder, I need to put you on
a whitelist so that doesn't happen again.

The above topology is not easy to represent, but I think it would work
like this (ignoring the threads/cores/clusters on the socket, which
would also need to be described in a full DT), using multiple logical
paths between the nodes:

socket 0
ibm,associativity = <0 0 0 0>, <1 1 1 0>, <2 2 0 0>, <3 0 0 0>;

socket 1
ibm,associativity = <1 1 1 1>, <0 0 0 1>, <2 2 2 1>, <3 3 1 1>;

socket 2
ibm,associativity = <2 2 2 2>, <0 0 2 2>, <1 1 1 2>, <3 3 3 2>;

socket 3
ibm,associativity = <3 3 3 3>, <0 3 3 3>, <1 1 3 3>, <2 2 2 3>;

This describes four levels or hierarchy, with the lowest level
being a single CPU core on one socket, and four paths between
the sockets. To compute the associativity between two sockets,
you need to look at each combination of paths to find the best
match.

Comparing sockets 0 and 1, the best matches are <1 1 1 0>
with <1 1 1 1>, and <0 0 0 0> with <0 0 0 1>. In each case, the
associativity is "3", meaning the first three entries match.

Comparing sockets 0 and 3, we have four equally bad matches
that each only match in the highest-level domain, e.g. <0 0 0 0>
with <0 3 3 3>, so the associativity is only "1", and that means
the two nodes are less closely associated than two neighboring
ones.

With the algorithm that powerpc uses to turn associativity into
distance, 2**(numlevels - associativity), this would put the
distance of neighboring nodes at "2", and the longest distance
at "8".

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
