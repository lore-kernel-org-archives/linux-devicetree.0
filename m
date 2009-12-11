From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] of: merge of_find_node_by_phandle
Date: Fri, 11 Dec 2009 00:09:24 -0700
Message-ID: <fa686aa40912102309y3b0882ddn90bb95c8ab0ae62d@mail.gmail.com>
References: <1260413279.306784.161998452424.1.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <1260413279.306784.161998452424.1.gpush@pororo>
Sender: sparclinux-owner@vger.kernel.org
To: Jeremy Kerr <jeremy.kerr@canonical.com>
Cc: devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, microblaze-uclinux@itee.uq.edu.au, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 9, 2009 at 7:47 PM, Jeremy Kerr <jeremy.kerr@canonical.com> wrote:
> Merge common function between powerpc, sparc and microblaze. Code is
> identical for powerpc and microblaze, but adds a lock (and release) of
> the devtree_lock on sparc.
>
> Currently untested.
>
> Signed-off-by: Jeremy Kerr <jeremy.kerr@canonical.com>

Added to my test branch.  We'll see how it shakes out.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
