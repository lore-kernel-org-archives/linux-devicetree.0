From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: [trivial PATCH] tps6507x.txt: Remove executable permission
Date: Thu, 16 Apr 2015 15:43:40 -0700
Message-ID: <1429224220.2850.59.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "joe@joe-X200MA:~/linux/net-next$ ./scripts/get_maintainer.pl -f  Documentation/devicetree/bindings/mfd/tps6507x.txt --nomultiline  --norolestats Rob Herring" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Documention text files shouldn't be executable.

Signed-off-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/tps6507x.txt | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/tps6507x.txt b/Documentation/devicetree/bindings/mfd/tps6507x.txt
old mode 100755
new mode 100644


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
