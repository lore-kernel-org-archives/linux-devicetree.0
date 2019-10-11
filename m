From: Saravana Kannan <saravanak@google.com>
Subject: [PATCH v1 2/3] driver: core: Improve documentation for fwnode_operations.add_links()
Date: Fri, 11 Oct 2019 12:15:20 -0700
Message-ID: <20191011191521.179614-3-saravanak@google.com>
References: <20191011191521.179614-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011191521.179614-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, kernel-team@android.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The add_links() ops shouldn't return on the first failed device link
add. It needs to continue trying to add device links to other suppliers
that are available. The documentation didn't explain WHY this behavior
is necessary. So, update the documentation with an example that explains
why this is necessary.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 include/linux/fwnode.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 6ae05b9ce359..97223e2410bd 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -71,8 +71,25 @@ struct fwnode_reference_args {
  *		links to all the suppliers of the device that are available at
  *		the time this function is called.  The function must NOT stop
  *		at the first failed device link if other unlinked supplier
- *		devices are present in the system.  If some suppliers are not
- *		yet available, this function will be called again when other
+ *		devices are present in the system.  This is necessary for the
+ *		driver/bus sync_state() callbacks to work correctly.
+ *
+ *		For example, say Device-C depends on suppliers Device-S1 and
+ *		Device-S2 and the dependency is listed in that order in the
+ *		firmware.  Say, S1 gets populated from the firmware after
+ *		late_initcall_sync().  Say S2 is populated and probed way
+ *		before that in device_initcall(). When C is populated, if this
+ *		add_links() function doesn't continue past a "failed linking to
+ *		S1" and continue linking C to S2, then S2 will get a
+ *		sync_state() callback before C is probed. This is because from
+ *		the perspective of S2, C was never a consumer when its
+ *		sync_state() evaluation is done. To avoid this, the add_links()
+ *		function has to go through all available suppliers of the
+ *		device (that corresponds to this fwnode) and link to them
+ *		before returning.
+ *
+ *		If some suppliers are not yet available (indicated by an error
+ *		return value), this function will be called again when other
  *		devices are added to allow creating device links to any newly
  *		available suppliers.
  *
-- 
2.23.0.700.g56cf767bdb-goog
