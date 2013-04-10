From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [RFC 0/2]  Add node and property realloc functions.
Date: Wed, 10 Apr 2013 15:31:18 +0100
Message-ID: <1365604278-17956-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

If you try to insert a new node or extend a property with large value, 
using fdtput you will notice that it always fails.

example:
fdtput -v -p -ts ./tst.dtb "/node-1" "property-1" "str10"
Error at 'node-1': FDT_ERR_NOSPACE

or

fdtput -v -c ./tst.dtb "/node-1"
Error at 'node-1': FDT_ERR_NOSPACE


fdtput -v  -ts ./tst.dtb "/node" "property" "very big value"
Decoding value:
	string: 'very big value'
Value size 15
Error at 'property': FDT_ERR_NOSPACE

All these error are returned from libfdt, as the size of the fdt passed
has not space to accomdate these new properties.

However,
libfdt has code to add new property or node or extend a property to an
arbitary value, however it cannot be used because all the library
functions take preallocated fdt pointer limted to a size.

Adding realloc function into libfdt can help tools like fdtput to insert
nodes or properties or extend a property.

As libfdt has knowlege of how much space a new property or node can take.
This patch set attempts to fix this issue by adding new libary functions
fdt_realloc_property and fdt_realloc_node.

comments?

Srinivas Kandagatla (2):
  libfdt: Add node and property realloc functions.
  fdtput: use libfdt realloc functions.

 fdtput.c        |   30 +++++++++++++++++-------------
 libfdt/fdt_rw.c |   39 +++++++++++++++++++++++++++++++++++++++
 libfdt/libfdt.h |    4 ++++
 3 files changed, 60 insertions(+), 13 deletions(-)

-- 
1.7.6.5
