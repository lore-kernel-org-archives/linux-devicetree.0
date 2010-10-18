From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 0/2] Series short description
Date: Mon, 18 Oct 2010 15:09:07 -0700
Message-ID: <20101018220341.25805.71490.stgit@riker>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The following series implements...

a new dtsi file for mpc5200 systems, and modifies media5200.dts file to use it.

The diff for the media5200.dts file may be confusing. I'll send the changed
file in a separate email as an attachment as well.

This should least let us see how the changes to the dts syntax look in a
real example.

- John

P.S. I can't tell if these comments go below the '---' below or above. In this
case, it looked like I should add my comments above. I'm hoping I'm right.

---

John Bonesio (2):
      New base dts file for mpc5200 systems.
      Updates the media5200 dts file to use the new base mpc5200 dts file


 media5200.dts |  338 ++++++++++++---------------------------------------------
 mpc5200b.dtsi |  294 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 364 insertions(+), 268 deletions(-)
 create mode 100644 mpc5200b.dtsi

-- 
Signature
