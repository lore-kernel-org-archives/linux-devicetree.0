From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v9 08/12] lib/vsprintf: Add a note on re-using %pf or %pF
Date: Thu,  3 Oct 2019 15:32:15 +0300
Message-ID: <20191003123219.11237-9-sakari.ailus@linux.intel.com>
References: <20191003123219.11237-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191003123219.11237-1-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Joe Perches <joe@perches.com>
List-Id: devicetree@vger.kernel.org

Add a note warning of re-use of obsolete %pf or %pF extensions.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Suggested-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 lib/vsprintf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index a58329c8fa750..cf48769fe330c 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2008,6 +2008,8 @@ static char *kobject_string(char *buf, char *end, void *ptr,
  * - 'S' For symbolic direct pointers (or function descriptors) with offset
  * - 's' For symbolic direct pointers (or function descriptors) without offset
  * - '[Ss]R' as above with __builtin_extract_return_addr() translation
+ * - '[Ff]' %pf and %pF were obsoleted and later removed in favor of
+ *	    %ps and %pS. Be careful when re-using these specifiers.
  * - 'B' For backtraced symbolic direct pointers with offset
  * - 'R' For decoded struct resource, e.g., [mem 0x0-0x1f 64bit pref]
  * - 'r' For raw struct resource, e.g., [mem 0x0-0x1f flags 0x201]
-- 
2.20.1
