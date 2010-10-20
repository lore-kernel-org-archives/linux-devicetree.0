From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 0/4] Series short description
Date: Wed, 20 Oct 2010 14:44:40 -0700
Message-ID: <20101020214419.2985.51068.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The following series implements...

1) new patch to update error messaging
2) new patch to remove existing nodes
3) patch to reference nodes by path or label/path at the root level
   I chose the following syntax:

   &{/path/to/a/node}       [existing syntax, now is allowed at the root level]
   &label                   [existing syntax]
   &{label}                 [new syntax]
   &{label/path/to/subnode} [new syntax]

4) patch to undefine properties

- John

---

John Bonesio (4):
      Create new and use new print_error that uses printf style formatting.
      Implements new features for updating existing device tree nodes.
      Allow nodes at the root to be specified by path as well as by label.
      Create a new property value that means 'undefined'.


 dtc-lexer.l  |   34 ++++++++++++++++++++++++--
 dtc-parser.y |   47 +++++++++++++++++++++++++++---------
 dtc.h        |    8 ++++++
 flattree.c   |    3 ++
 livetree.c   |   76 +++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 srcpos.c     |   21 ++++++++++------
 srcpos.h     |    2 ++
 7 files changed, 163 insertions(+), 28 deletions(-)

-- 
Signature
