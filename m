From: Grant Likely <grant.likely@secretlab.ca>
Subject: Elimination of of_platform_bus_type remains in devicetree/next
Date: Mon, 28 Feb 2011 13:59:37 -0700
Message-ID: <AANLkTim6fuYhPLRjwt814RjxV4Yp-tv4LQ6DBhdgGiDP@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Sender: linux-next-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

I've just pushed a big change out to my devicetree/next branch which
removes most users of of_platform_driver.  This gets rid of almost all
the remaining users.  ibmebus and macintosh are the last holdouts, but
they're pretty isolated and don't use the ugly shim that was in
drivers/of/platform.c.

This change very likely will break a few things.  I've done my best to
test it over many configurations, but I make no guarantees.  I've also
performed a test merge with linux-next, and am checking it for
breakage now.  You might want to move devicetree/next to the back of
the queue for your merge tonight (or whatever else you like to do to
mitigate damage).  :)

Let me know if it causes you any problems.

Thanks,
g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
