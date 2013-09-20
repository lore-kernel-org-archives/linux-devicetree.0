From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org>
Subject: Re: new cpu iteration code...
Date: Fri, 20 Sep 2013 17:44:04 +0100
Message-ID: <523C7B54.3070706@arm.com>
References: <20130918.173726.1443745664398441126.davem@davemloft.net> <523AC214.4040601@arm.com>	<523AFB6C.5070300@gmail.com> <20130919.133805.1227344435777214810.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130919.133805.1227344435777214810.davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Cc: Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org, "robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 19/09/13 18:38, David Miller wrote:
> From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Thu, 19 Sep 2013 08:26:04 -0500
> 
>> The simple solution here is to just remove the warning. It doesn't
>> appear to me that sparc ever sets the cpu device of_node pointer.
> 
> Why wouldn't I want sparc to have this functionality now that the
> code is generically available.
> 
Makes sense, but as you mentioned before we need to match other property
names namely "upa-portid", "portid" or "cpuid" for cpu physical id right
? Are all these 32-bit values ?

>> Are there any cases on where sparc does have a /cpus node? If so we'd
>> need to make of_get_cpu_node a weak function or depend on a kconfig option.
> 
> I already gave a solution to this problem, make the loop iterator be:
> 
> 	for_each_node_by_type(dp, "cpu")
> 

Does it make sense use this only when /cpus is not found ?
IMHO as the number of node in DT increases(which is the case on ARM
platforms) parsing entire tree may be expensive(which can be avoided in
case /cpus is found)

How about something like below ? I am not sure if of_n_addr_cells logic works
for those properties on SPARC.

Regards,
Sudeep

---->8

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b2cee3d..83512ea 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -280,6 +280,31 @@ static bool __of_find_n_match_cpu_property(struct
device_node *cpun,
 	return false;
 }

+static bool __of_match_cpu_property(struct device_node *cpun, int cpu,
+							unsigned int *thread)
+	/* Check for non-standard "ibm,ppc-interrupt-server#s" property
+	 * for thread ids on PowerPC. If it doesn't exist fallback to
+	 * standard "reg" property.
+	 */
+	if (IS_ENABLED(CONFIG_PPC) &&
+		__of_find_n_match_cpu_property(cpun,
+				"ibm,ppc-interrupt-server#s", cpu, thread))
+		return true;
+	/* Check for "upa-portid" or "portid" property on SPARC */
+	if (IS_ENABLED(CONFIG_SPARC)) {
+		if (__of_find_n_match_cpu_property(cpun, "upa-portid",
+							cpu, thread))
+			return true;
+		if (__of_find_n_match_cpu_property(cpun, "portid",
+							cpu, thread))
+			return true;
+	}
+	if (__of_find_n_match_cpu_property(cpun, "reg", cpu, thread))
+		return true;
+
+	return false;
+}
 /**
  * of_get_cpu_node - Get device node associated with the given logical CPU
  *
@@ -303,24 +328,17 @@ struct device_node *of_get_cpu_node(int cpu, unsigned int
*thread)
 	struct device_node *cpun, *cpus;

 	cpus = of_find_node_by_path("/cpus");
-	if (!cpus) {
-		pr_warn("Missing cpus node, bailing out\n");
-		return NULL;
-	}
-
-	for_each_child_of_node(cpus, cpun) {
-		if (of_node_cmp(cpun->type, "cpu"))
-			continue;
-		/* Check for non-standard "ibm,ppc-interrupt-server#s" property
-		 * for thread ids on PowerPC. If it doesn't exist fallback to
-		 * standard "reg" property.
-		 */
-		if (IS_ENABLED(CONFIG_PPC) &&
-			__of_find_n_match_cpu_property(cpun,
-				"ibm,ppc-interrupt-server#s", cpu, thread))
-			return cpun;
-		if (__of_find_n_match_cpu_property(cpun, "reg", cpu, thread))
-			return cpun;
+	if (cpus) {
+		for_each_child_of_node(cpus, cpun) {
+			if (of_node_cmp(cpun->type, "cpu"))
+				continue;
+			if (__of_match_cpu_property(cpun, cpu, thread))
+				return cpun;
+		}
+	} else {
+		for_each_node_by_type(cpun, "cpu")
+			if (__of_match_cpu_property(cpun, cpu, thread))
+				return cpun;
 	}
 	return NULL;
 }

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
