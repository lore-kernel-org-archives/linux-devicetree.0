From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/3] libfdt: Add function to find regions in an FDT
Date: Tue, 12 Mar 2013 20:46:12 -0700
Message-ID: <CAPnjgZ2uPRtDZXt1AwtAnp702sEya6OxtDpEy1kUD=Wox=0CfA@mail.gmail.com>
References: <1360968578-18443-1-git-send-email-sjg@chromium.org>
 <1360968578-18443-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360968578-18443-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Feb 15, 2013 at 2:49 PM, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> Given a set of nodes and properties, find the regions of the device tree
> which describe those parts.
>
> A test is provided which builds a tree while tracking where the regions
> should be, then calls fdt_first/next_region() to make sure that it agrees.
>
> Further tests will come as part of fdtgrep.
>
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I just wondered if there any any comments on this new version?

> ---
> Changes in v2:
> - Move region code to separate fdt_region.c file
> - Fix info->count <= info->max_regions in fdt_add_region() merge case
> - Add new FDT_ERR_TOODEEP error type and use it
> - Change returned error from BADLAYOUT to BADSTRUCTURE
> - Return FDT_ERR_BADLAYOUT error if strings block is before structure block
> - Add note that changes in node/property order can cause false hash misses
> - Add more comments about the -1 return value from h_include
> - Drop FDT_IS_COMPAT and pass node offset to h_include function
> - Drop stale comment about names / wildcards
> - Move to a model with fdt_first_region()/fdt_next_region()
> - Add long comment explaining theory of operation
>
>  libfdt/Makefile.libfdt |   3 +-
>  libfdt/fdt_region.c    | 452 +++++++++++++++++++++++++++++++++++++++++++++++++
>  libfdt/libfdt.h        | 213 ++++++++++++++++++++++-
>  tests/.gitignore       |   1 +
>  tests/Makefile.tests   |   3 +-
>  tests/region_tree.c    | 336 ++++++++++++++++++++++++++++++++++++
>  tests/run_tests.sh     |   5 +
>  7 files changed, 1010 insertions(+), 3 deletions(-)
>  create mode 100644 libfdt/fdt_region.c
>  create mode 100644 tests/region_tree.c
>

Regards,
Simon
