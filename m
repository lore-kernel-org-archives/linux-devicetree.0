From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: Drop redundant check in linker section OF match table
Date: Wed, 20 Mar 2019 12:55:41 -0700
Message-ID: <67db2d00-26d0-f9e3-f4dd-0f48633142a9@gmail.com>
References: <1553078940-9907-1-git-send-email-mojha@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553078940-9907-1-git-send-email-mojha@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mukesh Ojha <mojha@codeaurora.org>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 3/20/19 3:49 AM, Mukesh Ojha wrote:
> Existing check of `fn` against NULL inside OF match table
> is redundant. Remove the check.
> 
> Signed-off-by: Mukesh Ojha <mojha@codeaurora.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> Cc: devicetree@vger.kernel.org
> ---
>  include/linux/of.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/of.h b/include/linux/of.h
> index e240992..b86c00a 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -1283,13 +1283,13 @@ static inline int of_get_available_child_count(const struct device_node *np)
>  	static const struct of_device_id __of_table_##name		\
>  		__used __section(__##table##_of_table)			\
>  		 = { .compatible = compat,				\
> -		     .data = (fn == (fn_type)NULL) ? fn : fn  }
> +		     .data = fn }
>  #else
>  #define _OF_DECLARE(table, name, compat, fn, fn_type)			\
>  	static const struct of_device_id __of_table_##name		\
>  		__attribute__((unused))					\
>  		 = { .compatible = compat,				\
> -		     .data = (fn == (fn_type)NULL) ? fn : fn }
> +		     .data = fn }
>  #endif
>  
>  typedef int (*of_init_fn_2)(struct device_node *, struct device_node *);
> 

The check is not redundant and does serve a purpose.

The purpose is not very obvious on the surface, but it is checking that
the function fn() is of the proper type.

An example of a compiler warning with a bad function type is created
by applying the following patch:

   drivers/of/unittest.c:62:1: warning: comparison of distinct pointer types lacks a cast [enabled by default]

Note that you need to have CONFIG_UNITTEST enabled to compile unittest.c.

Line 62 is
   OF_DECLARE_1(__unittest_of_table, unittest_setup_2_bad, "unittest_compat",

---
 drivers/of/unittest.c |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

Index: b/drivers/of/unittest.c
===================================================================
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -45,6 +45,23 @@ static struct unittest_results {
 	failed; \
 })
 
+struct of_device_id __unittest_of_table;
+
+static void __init unittest_setup_1_good(struct device_node *np)
+{
+}
+
+static void __init unittest_setup_2_bad(struct device_node *np_1,
+	struct device_node *np_2)
+{
+}
+
+OF_DECLARE_1(__unittest_of_table, unittest_setup_1_good, "unittest_compat",
+	unittest_setup_1_good);
+
+OF_DECLARE_1(__unittest_of_table, unittest_setup_2_bad, "unittest_compat",
+	unittest_setup_2_bad);
+
 static void __init of_unittest_find_node_by_name(void)
 {
 	struct device_node *np;
