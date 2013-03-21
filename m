From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Locating syntax error in dts/dtsi files
Date: Thu, 21 Mar 2013 13:42:40 +0530
Message-ID: <CAK9yfHzSiXk+4XqpEdmGhdD+pWcv8O_NCNRbNTv9tGNntFWdvg@mail.gmail.com>
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
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I was wondering if there is any way to locate the syntax error in
included .dtsi files (other than manually inspecting them).
In certain cases dtc only points at the line which includes the dtsi
file inside the dts file as the location of syntax (parsing error) and
does not pinpoint the line number inside the .dtsi file.

For e.g.
When a terminating brace and semicolon "};" was missing in
arch/arm/boot/dts/exynos4.dtsi, dtc gave the following error when I
did 'make dtbs'

Error: arch/arm/boot/dts/exynos4210-pinctrl.dtsi:17.1-2 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [arch/arm/boot/dts/exynos4210-origen.dtb] Error 1
make: *** [dtbs] Error 2

In this case it doesn't even tell the actual file that has a problem.
-- 
With warm regards,
Sachin
