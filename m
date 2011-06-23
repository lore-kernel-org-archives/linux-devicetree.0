From: Anton Staaf <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/2] Character literal parsing
Date: Thu, 23 Jun 2011 16:20:37 -0700
Message-ID: <1308871239-32683-1-git-send-email-robotboy@chromium.org>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

    These patches add simple and escaped character literal parsing support
to the dct for bytestrings.  The first patch is very simple and provides
most of the functionality that is useful.  The second patch is of more
debatable value.  I've included it for completeness.

    Thanks,
        Anton

--

Anton Staaf (2):
  Add character literal parsing in bytestrings
  Add escaped character support to character literals

 Documentation/dts-format.txt |    5 +-
 Documentation/manual.txt     |    7 ++-
 data.c                       |   77 +--------------------------------
 dtc-lexer.l                  |   16 +++++++
 util.c                       |   98 ++++++++++++++++++++++++++++++++++++++++++
 util.h                       |    5 ++
 6 files changed, 127 insertions(+), 81 deletions(-)

-- 
1.7.3.1
