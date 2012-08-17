From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: Re: [RFC:PATCH dtc-1.3.0] dtc: Add --strip-disabled option to dtc.
Date: Fri, 17 Aug 2012 09:55:03 +0100
Message-ID: <502E06E7.5070008@st.com>
References: <1345034325-26656-1-git-send-email-srinivas.kandagatla@st.com>
 <20120817060415.GC29724@truffula.fritz.box>
Reply-To: srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120817060415.GC29724-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, mmarek-AlSwsSmVLrQ@public.gmane.org, B04825-KZfg59tc24xl57MIdRCFDg@public.gmane.org, jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17/08/12 07:04, David Gibson wrote:
> On Wed, Aug 15, 2012 at 01:38:45PM +0100, Srinivas KANDAGATLA wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>>
>> This patch allows dtc to strip out nodes in its output based on status
>> property. Now the dtc has additional long option --strip-disabled to
>> strip all the nodes which have status property set to disabled.
>>
>> SOCs have lot of device tree infrastructure files which mark the
>> device nodes as disabled and the board level device tree enables them if
>> required. However while creating device tree blob, the compiler can
>> exclude nodes marked as disabled, doing this way will reduce the size
>> of device tree blob.
>>
>> However care has to be taken if your boardloader is is updating status
>> property.
>>
>> In our case this has reduced the blob size from 29K to 15K.
>>
>> Also nodes with status="disabled" is are never probed by dt platform bus
>> code.
>>
>> Again, this is an optional parameter to dtc, Can be used by people who
>> want to strip all the device nodes which are marked as disabled.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
>> ---
>> Hi Jon, 
>>
>> I have noticed that the dtb blob also contains device nodes with property status = "disabled", 
>> But these device nodes are not used by device tree platform bus probe code or any of the kernel code.
>>
>> If there is no active code which actually modifies status property at runtime, it makes sense to remove 
>> those nodes from the dtb to reduce the overall size of dtb.
>>
>> The size change will be significant once the SOC adds all the possible devices in to the device trees.
>> As there could be 100s of Ips on SOCs but the board actually uses may be 20-25 IP's.
>>
>> My patch adds option --strip-disabled option to dtc to strip such nodes, resulting in only nodes which 
>> are supposed to be instantiated.
>>
>> This patch is generated on top of git://git.jdl.com/software/dtc.git.
>>
>> previous discussion on this patch is at:http://comments.gmane.org/gmane.linux.kbuild.devel/8527
>>
>> Comments?
>>
>> Thanks,
>> srini
>>
>>  dtc.c        |   14 ++++++++++++--
>>  dtc.h        |    4 ++++
>>  flattree.c   |    3 +++
>>  livetree.c   |   17 +++++++++++++++++
>>  treesource.c |    3 +++
>>  5 files changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/dtc.c b/dtc.c
>> index a375683..b303cab 100644
>> --- a/dtc.c
>> +++ b/dtc.c
>> @@ -30,6 +30,7 @@ int quiet;		/* Level of quietness */
>>  int reservenum;		/* Number of memory reservation slots */
>>  int minsize;		/* Minimum blob size */
>>  int padsize;		/* Additional padding to blob */
>> +int strip_disabled;	/* strip disabled nodes in output */
>>  int phandle_format = PHANDLE_BOTH;	/* Use linux,phandle or phandle properties */
>>  
>>  static void fill_fullpaths(struct node *tree, const char *prefix)
>> @@ -96,6 +97,8 @@ static void  __attribute__ ((noreturn)) usage(void)
>>  	fprintf(stderr, "\t-W [no-]<checkname>\n");
>>  	fprintf(stderr, "\t-E [no-]<checkname>\n");
>>  	fprintf(stderr, "\t\t\tenable or disable warnings and errors\n");
>> +	fprintf(stderr, "\t--strip-disabled\n");
>> +	fprintf(stderr, "\t\tStrip nodes with status property as disabled\n");
>>  	exit(3);
>>  }
>>  
>> @@ -112,15 +115,22 @@ int main(int argc, char *argv[])
>>  	FILE *outf = NULL;
>>  	int outversion = DEFAULT_FDT_VERSION;
>>  	long long cmdline_boot_cpuid = -1;
>> +	struct option loptions[] =	{
>> +		{"strip-disabled", no_argument, &strip_disabled, 1},
>> +	};
>>  
>>  	quiet      = 0;
>>  	reservenum = 0;
>>  	minsize    = 0;
>>  	padsize    = 0;
>> +	strip_disabled = 0;
>>  
>> -	while ((opt = getopt(argc, argv, "hI:O:o:V:d:R:S:p:fqb:i:vH:sW:E:"))
>> -			!= EOF) {
>> +	while ((opt = getopt_long(argc, argv,
>> +				"hI:O:o:V:d:R:S:p:fqb:i:vH:sW:E:",
>> +				loptions, NULL)) != EOF) {
>>  		switch (opt) {
>> +		case 0: /* Long option set */
>> +			break;
>>  		case 'I':
>>  			inform = optarg;
>>  			break;
>> diff --git a/dtc.h b/dtc.h
>> index 7ee2d54..67cdadc 100644
>> --- a/dtc.h
>> +++ b/dtc.h
>> @@ -31,6 +31,7 @@
>>  #include <ctype.h>
>>  #include <errno.h>
>>  #include <unistd.h>
>> +#include <getopt.h>
>>  
>>  #include <libfdt_env.h>
>>  #include <fdt.h>
>> @@ -53,6 +54,7 @@ extern int quiet;		/* Level of quietness */
>>  extern int reservenum;		/* Number of memory reservation slots */
>>  extern int minsize;		/* Minimum blob size */
>>  extern int padsize;		/* Additional padding to blob */
>> +extern int strip_disabled;	/* strip disabled nodes in output */
>>  extern int phandle_format;	/* Use linux,phandle or phandle properties */
>>  
>>  #define PHANDLE_LEGACY	0x1
>> @@ -224,6 +226,8 @@ struct boot_info *build_boot_info(struct reserve_info *reservelist,
>>  				  struct node *tree, uint32_t boot_cpuid_phys);
>>  void sort_tree(struct boot_info *bi);
>>  
>> +int is_device_node_avaiable(struct node *node);
>> +
>>  /* Checks */
>>  
>>  void parse_checks_option(bool warn, bool error, const char *optarg);
>> diff --git a/flattree.c b/flattree.c
>> index 28d0b23..7d4e13b 100644
>> --- a/flattree.c
>> +++ b/flattree.c
>> @@ -304,6 +304,9 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
>>  	}
>>  
>>  	for_each_child(tree, child) {
>> +		if (strip_disabled && !is_device_node_avaiable(child))
>> +			continue;
>> +
> Hrm, it's not a lot of code, but I don't like that the strip logic is
> duplicated between the flat tree and treesource backends.  What I'd
> prefer to see here is just if (node_is_stripped(...)) with the
> node_is_stripped() function taking into account the option values and
> whatever other information.
Yes, I agree we could improve this code.
>
>>  		flatten_tree(child, emit, etarget, strbuf, vi);
>>  	}
>>  
>> diff --git a/livetree.c b/livetree.c
>> index c9209d5..7155926 100644
>> --- a/livetree.c
>> +++ b/livetree.c
>> @@ -607,3 +607,20 @@ void sort_tree(struct boot_info *bi)
>>  	sort_reserve_entries(bi);
>>  	sort_node(bi->dt);
>>  }
>> +
>> +int is_device_node_avaiable(struct node *node)
>> +{
>> +	struct property *status;
>> +
>> +	status = get_property(node, "status");
>> +	if (status == NULL)
>> +		return 1;
>> +
>> +	if (status->val.len > 0) {
>> +		if (!strcmp(status->val.val, "okay") ||
>> +			 !strcmp(status->val.val, "ok"))
>> +			return 1;
>> +	}
> The name still isn't quite right - it doesn't just strip disabled
> nodes but anything that isn't "okay", OF defines "failed" at least as
> another possibility for the status property.
Good point, I think I should document this in help, it makes sense to
strip anything which is not "okay" or "ok".
Will modify help accordingly.

>
>> +	return 0;
>> +}
>> diff --git a/treesource.c b/treesource.c
>> index 33eeba5..2f1ac1a 100644
>> --- a/treesource.c
>> +++ b/treesource.c
>> @@ -255,6 +255,9 @@ static void write_tree_source_node(FILE *f, struct node *tree, int level)
>>  		write_propval(f, prop);
>>  	}
>>  	for_each_child(tree, child) {
>> +		if (strip_disabled && !is_device_node_avaiable(child))
>> +			continue;
>> +
>>  		fprintf(f, "\n");
>>  		write_tree_source_node(f, child, level+1);
>>  	}
