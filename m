From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [git pull] a couple more device tree changes for v3.3
Date: Fri, 13 Jan 2012 22:51:16 -0700
Message-ID: <CACxGe6uN5YRcwLLfrMqWghSv0V7X7-6VW=Ey_P5QpVwQNaUMvw@mail.gmail.com>
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
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Here are a couple more device tree changes that I'd really like to get
into v3.3.  This sorts out driver resource decoding for some ARM
platforms using the device tree.

Thanks,
g.

The following changes since commit 2145199c4f0db7c517dd788abec301dc84b91bd0:

  Merge branch 'drm-fixes' of
git://people.freedesktop.org/~airlied/linux (2012-01-13 20:48:42
-0800)

are available in the git repository at:

  git://git.secretlab.ca/git/linux-2.6 devicetree-for-linus

Benoit Cousson (2):
      of/address: Add reg-names property to name an iomem resource
      of/irq: Add interrupts-names property to name an irq resource

 .../devicetree/bindings/resource-names.txt         |   54 ++++++++++++++++++++
 drivers/of/address.c                               |   16 ++++--
 drivers/of/irq.c                                   |   11 ++++-
 3 files changed, 75 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/resource-names.txt


-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
