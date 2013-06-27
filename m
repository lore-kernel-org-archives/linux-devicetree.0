From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Testing a OF Device Tree driver on a kernel using a board file.
Date: Thu, 27 Jun 2013 23:07:35 +0100
Message-ID: <CACxGe6tUgUaKtfgGpD4He++mZ5WxGmPDL-SoF5gJKLOtCpACFA@mail.gmail.com>
References: <F14D68B9-D4F3-4185-BF5A-833780FFCEFC@ingenutec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <F14D68B9-D4F3-4185-BF5A-833780FFCEFC-yOrjPonjKN58UrSeD/g0lQ@public.gmane.org>
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
To: "Mr. Robert G Palmer Jr." <robert.palmer-yOrjPonjKN58UrSeD/g0lQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 27, 2013 at 9:22 PM, Mr. Robert G Palmer Jr.
<robert.palmer-yOrjPonjKN58UrSeD/g0lQ@public.gmane.org> wrote:
> I apologize up front if this is the wrong place for these questions.  I'm
> relatively new to the OF Device Tree.  If this is the wrong place, would
> someone point me to the correct discussion location.
>
> 1. Is it possible to take an existing kernel build that uses a board file
> move only a small portion into a Device Tree.  I am working on converting a
> driver from supporting only the board file to supporting both the board file
> and the OF Device Tree.  Unfortunately, the only test platform I have with
> the appropriate hardware is a Nexus7 and I'm using the Cyanogenmod build.
> This uses (or at least appears to use) a board file for the Nexus7.  Is it
> possible to write a small Device Tree description for only the driver I am
> working on?  Where would this device tree file be placed? How would I
> include it in the build? Any assistance and/or pointers would be
> appreciated.

Yes. Enable CONFIG_OF and add a dt_compat pointer to the existing
nexus7 MACHINE_START() stanze. Then a trivial device tree with a
top-level compatible property that matches something in the dt_compat
table can be used to boot the platform.

arch/arm/mach-versatile/versatile_dt.c shows an example.

> 2. Are there any suggestions or hints for searching for OF Device Tree
> information.  The term "device tree" is used pervasively in the linux code
> and various projects to refer to source branches of a particular device type
> rather than the OF Device Tree.  This makes it extremely difficult to
> isolate applicable answers.

This link is useful:
http://devicetree.org/Device_Tree_Usage

Also, look at the files in Documentation/devicetree in the Linux kernel.

g.
