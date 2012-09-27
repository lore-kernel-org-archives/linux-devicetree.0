From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [RFC PATCH 1/3] kbuild: introduce cmd_dtc_cpp
Date: Thu, 27 Sep 2012 19:40:33 +0200
Message-ID: <20120927174033.GU17667@game.jcrosoft.org>
References: <1348599998-2729-1-git-send-email-swarren@wwwdotorg.org>
 <1348599998-2729-2-git-send-email-swarren@wwwdotorg.org>
 <20120927054438.GM17667@game.jcrosoft.org>
 <50647330.9030306@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <50647330.9030306@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Jon Loeliger <jdl@jdl.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

On 09:39 Thu 27 Sep     , Stephen Warren wrote:
> On 09/26/2012 11:44 PM, Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 13:06 Tue 25 Sep     , Stephen Warren wrote:
> >> From: Stephen Warren <swarren@nvidia.com>
> >>
> >> cmd_dtc_cpp runs the C pre-processor on the input .dts file before
> >> passing it to dtc for final compilation. This allows used of #define
> >> within the .dts file.
> >>
> >> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> >> ---
> >>  scripts/Makefile.lib |    3 +++
> >>  1 files changed, 3 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> >> index 0be6f11..e3a149e 100644
> >> --- a/scripts/Makefile.lib
> >> +++ b/scripts/Makefile.lib
> >> @@ -266,6 +266,9 @@ $(obj)/%.dtb.S: $(obj)/%.dtb
> >>  quiet_cmd_dtc = DTC     $@
> >>  cmd_dtc = $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) -d $(depfile) $<
> >>  
> >> +quiet_cmd_dtc_cpp = DTC+CPP $@
> >> +cmd_dtc_cpp = $(CC) -E -Wp,-MD,$(depfile) -xc $< | $(objtree)/scripts/dtc/dtc -O dtb -o $@ -b 0 $(DTC_FLAGS) -
> >
> > this should go to Makefile.build
> 
> Hmm. Consistency with the existing cmd_dtc right above would dictate
> otherwise.
no build command go to Makefile.build aside with makefile target

Best Regards,
J.
