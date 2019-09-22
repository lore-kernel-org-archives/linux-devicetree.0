From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v17 07/19] kunit: test: add initial tests
Date: Sun, 22 Sep 2019 09:28:28 -0700
Message-ID: <944ac47d-1411-9ebd-d0d4-a616c88c9c20@infradead.org>
References: <20190921001855.200947-1-brendanhiggins@google.com>
 <20190921001855.200947-8-brendanhiggins@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20190921001855.200947-8-brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jpoimboe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, keescook-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, mcgrof-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, tytso-3s7WtUTddSA@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org
Cc: pmladek-IBi9RG/b67k@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amir73il-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alexander.Levin-0li6OtcxBFHby3iVrkZq2A@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, knut.omang-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, wfg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jdike-OPE4K8JWMJJBDgjK7y7TUQ@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tim.Bird-7U/KSKJipcs@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org, kunit-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 9/20/19 5:18 PM, Brendan Higgins wrote:
> Add a test for string stream along with a simpler example.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Reviewed-by: Logan Gunthorpe <logang-OTvnGxWRz7hWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  lib/kunit/Kconfig              | 25 ++++++++++
>  lib/kunit/Makefile             |  4 ++
>  lib/kunit/example-test.c       | 88 ++++++++++++++++++++++++++++++++++
>  lib/kunit/string-stream-test.c | 52 ++++++++++++++++++++
>  4 files changed, 169 insertions(+)
>  create mode 100644 lib/kunit/example-test.c
>  create mode 100644 lib/kunit/string-stream-test.c
> 
> diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
> index 666b9cb67a74..3868c226cf31 100644
> --- a/lib/kunit/Kconfig
> +++ b/lib/kunit/Kconfig
> @@ -11,3 +11,28 @@ menuconfig KUNIT
>  	  special hardware when using UML. Can also be used on most other
>  	  architectures. For more information, please see
>  	  Documentation/dev-tools/kunit/.
> +
> +if KUNIT

The 'if' above provides the dependency clause, so the 2 'depends on KUNIT'
below are not needed.  They are redundant.

> +
> +config KUNIT_TEST
> +	bool "KUnit test for KUnit"
> +	depends on KUNIT
> +	help
> +	  Enables the unit tests for the KUnit test framework. These tests test
> +	  the KUnit test framework itself; the tests are both written using
> +	  KUnit and test KUnit. This option should only be enabled for testing
> +	  purposes by developers interested in testing that KUnit works as
> +	  expected.
> +
> +config KUNIT_EXAMPLE_TEST
> +	bool "Example test for KUnit"
> +	depends on KUNIT
> +	help
> +	  Enables an example unit test that illustrates some of the basic
> +	  features of KUnit. This test only exists to help new users understand
> +	  what KUnit is and how it is used. Please refer to the example test
> +	  itself, lib/kunit/example-test.c, for more information. This option
> +	  is intended for curious hackers who would like to understand how to
> +	  use KUnit for kernel development.
> +
> +endif # KUNIT



-- 
~Randy
