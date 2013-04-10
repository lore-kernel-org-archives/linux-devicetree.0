From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 00/10 v2] usage()/--help clean up & unification
Date: Wed, 10 Apr 2013 14:29:05 -0400
Message-ID: <1365618555-5893-1-git-send-email-vapier@gentoo.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Each utility currently open codes how they process options and
implement usage().  This leads to inconsistent behavior and output
which sucks.  A bunch also get common things wrong (like sending
--help to stderr).

Rather than go through them one by one and fix their bugs, start
a new mini framework in the util.[ch] code base.  This allows the
utils to be much more data driven in their approach to options --
they declare certain structures with the right format, and then
call usage() as needed.  The new util code takes care of the rest.

I also snuck in a few minor fixes in this patch series that I
noticed as I was hacking on things.  Really I just wanted a --scan
option in the fdtdump tool :).

For the v2 series, I fixed a compile/output bug in one of the
patches and this now passes `make check`.  I also added a --debug
option to fdtdump.

Mike Frysinger (10):
  utilfdt_read_err: use xmalloc funcs
  utilfdt_read: pass back up the length of data read
  die: constify format string arg
  util_version: new helper for displaying version info
  fdtdump: make usage a bit more friendly
  fdtdump: add a --scan option
  dtc/fdt{get,put}/convert-dtsv0-lexer: convert to new usage helpers
  util: drop "long" from usage helpers
  util: add common ARRAY_SIZE define
  fdtdump: add a debug mode

 convert-dtsv0-lexer.l |  24 +++++++----
 dtc.c                 | 116 +++++++++++++++++++++++++-------------------------
 dtc.h                 |   1 -
 fdtdump.c             | 109 ++++++++++++++++++++++++++++++++++++++++++-----
 fdtget.c              |  62 ++++++++++++---------------
 fdtput.c              |  65 +++++++++++++---------------
 tests/testutils.c     |   2 +-
 util.c                |  73 ++++++++++++++++++++++++++++---
 util.h                |  78 +++++++++++++++++++++++++++++++--
 9 files changed, 375 insertions(+), 155 deletions(-)

-- 
1.8.1.2
