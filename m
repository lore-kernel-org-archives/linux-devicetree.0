From: Gala Kumar-B11780 <B11780-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] powerpc/mpic: Add Open-PIC global timer document
Date: Fri, 10 Aug 2012 13:35:35 +0000
Message-ID: <94D8FBCC-7AA8-4F50-90A3-2A11F579AC34@freescale.com>
References: <1344578002-8057-1-git-send-email-Dongsheng.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1344578002-8057-1-git-send-email-Dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Content-ID: <C6485F29C99A0B4C858643E8EEF7C2F5-725oAoX4OcF2GV6JINhBVAC/G2K4zDHf@public.gmane.org>
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
To: Wang Dongsheng-B40534 <B40534-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Wood Scott-B07421 <B07421-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org Discuss" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Yoder Stuart-B08248 <B08248-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org list" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Aug 10, 2012, at 12:53 AM, <Dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org> <Dongsheng.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> From: Wang Dongsheng <Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Add a description of the OPEN-PIC global timer in the OPEN-PIC document.
> 
> Moidfy mpic-timer document. 1.Add a TFRR register region. This register
> is written by software to report the clocking frequency of the PIC timers.
> 2.Add a device_type. The global timer in line with the OPEN-PIC specification.
> 
> Signed-off-by: Wang Dongsheng <Dongsheng.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Li Yang <leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> Documentation/devicetree/bindings/open-pic.txt     |   46 ++++++++++++++++++++

Let's separate out the open-pic.txt timer binding change into its own patch from the FSL timer binding & dtsi updates.

> .../devicetree/bindings/powerpc/fsl/mpic-timer.txt |   21 +++++----
> arch/powerpc/boot/dts/fsl/pq3-mpic-timer-B.dtsi    |    7 ++-
> arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi            |    7 ++-
> 4 files changed, 66 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/open-pic.txt b/Documentation/devicetree/bindings/open-pic.txt
> index 909a902..045c2e9 100644
> --- a/Documentation/devicetree/bindings/open-pic.txt
> +++ b/Documentation/devicetree/bindings/open-pic.txt
> @@ -92,6 +92,52 @@ Example 2:
> 
> * References
> 
> +* Open PIC global timers
> +
> +Required properties:
> +- compatible: "open-pic,global-timer"
> +
> +- reg : Contains two regions.  The first is the timer frequency reporting
> +  register for the group.  The second is the main timer register bank
> +  (GTCCR, GTBCR, GTVPR, GTDR).
> +
> +- available-ranges: use <start count> style section to define which
> +  timer interrupts can be used.  This property is optional; without this,
> +  all timers within the group can be used.
> +
> +- interrupts: one interrupt per timer in the group, in order, starting
> +  with timer zero.  If available-ranges is present, only the interrupts
> +  that correspond to available timers shall be present.
> +

If we are going to require device_type property it should be in the binding.

Based on the comments in ePAPR, I recommend dropping device_type from the timer binding.

> +* Examples
> +
> +Example 1:
> +
> +	/* Note that this requires #interrupt-cells to be 4 */
> +	timer: timer@010f0 {
> +		compatible = "open-pic,global-timer";
> +		device_type = "open-pic";
> +		reg = <0x010f0 4 0x01100 0x100>;
> +
> +		/* Another AMP partition is using timer */
> +		available-ranges = <2 2>;
> +
> +		interrupts = <2 0 3 0
> +		              3 0 3 0>;
> +	};
> +
> +Example 2:
> +
> +	timer: timer@010f0 {
> +		compatible = "open-pic,global-timer";
> +		device_type = "open-pic";
> +		reg = <0x010f0 4 0x01100 0x100>;
> +		interrupts = <0 0 3 0
> +			      1 0 3 0
> +			      2 0 3 0
> +		              3 0 3 0>;
> +	};
> +
> [1] Power.org (TM) Standard for Embedded Power Architecture (TM) Platform
>     Requirements (ePAPR), Version 1.0, July 2008.
>     (http://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.0.pdf)
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/mpic-timer.txt b/Documentation/devicetree/bindings/powerpc/fsl/mpic-timer.txt
> index df41958..5aafca0 100644
> --- a/Documentation/devicetree/bindings/powerpc/fsl/mpic-timer.txt
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/mpic-timer.txt
> @@ -1,13 +1,14 @@
> * Freescale MPIC timers
> 
> Required properties:
> -- compatible: "fsl,mpic-global-timer"
> +- compatible: "fsl,global-timer"

Why are renaming?.. also use of fsl,global-timer is to generic of a name for the this.

> 
> -- reg : Contains two regions.  The first is the main timer register bank
> -  (GTCCRxx, GTBCRxx, GTVPRxx, GTDRxx).  The second is the timer control
> +- reg : Contains three regions.  The first is the timer frequency reporting
> +  register (TFRRx) for the group.  The second is the main timer register
> +  bank (GTCCRxx, GTBCRxx, GTVPRxx, GTDRxx).  The third is the timer control
>   register (TCRx) for the group.
> 
> -- fsl,available-ranges: use <start count> style section to define which
> +- available-ranges: use <start count> style section to define which
>   timer interrupts can be used.  This property is optional; without this,
>   all timers within the group can be used.
> 
> @@ -18,19 +19,21 @@ Required properties:
> Example:
> 	/* Note that this requires #interrupt-cells to be 4 */
> 	timer0: timer@41100 {
> -		compatible = "fsl,mpic-global-timer";
> -		reg = <0x41100 0x100 0x41300 4>;
> +		compatible = "fsl,global-timer";
> +		device_type = "open-pic";
> +		reg = <0x410f0 4 0x41100 0x100 0x41300 4>;
> 
> 		/* Another AMP partition is using timers 0 and 1 */
> -		fsl,available-ranges = <2 2>;
> +		available-ranges = <2 2>;
> 
> 		interrupts = <2 0 3 0
> 		              3 0 3 0>;
> 	};
> 
> 	timer1: timer@42100 {
> -		compatible = "fsl,mpic-global-timer";
> -		reg = <0x42100 0x100 0x42300 4>;
> +		compatible = "fsl,global-timer";
> +		device_type = "open-pic";
> +		reg = <0x420f0 4 0x42100 0x100 0x42300 4>;
> 		interrupts = <4 0 3 0
> 		              5 0 3 0
> 		              6 0 3 0
> diff --git a/arch/powerpc/boot/dts/fsl/pq3-mpic-timer-B.dtsi b/arch/powerpc/boot/dts/fsl/pq3-mpic-timer-B.dtsi
> index 8734cff..01cd33c 100644
> --- a/arch/powerpc/boot/dts/fsl/pq3-mpic-timer-B.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/pq3-mpic-timer-B.dtsi
> @@ -32,9 +32,10 @@
>  * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>  */
> 
> -timer@42100 {
> -	compatible = "fsl,mpic-global-timer";
> -	reg = <0x42100 0x100 0x42300 4>;
> +timer@420f0 {
> +	compatible = "fsl,global-timer";

Shouldn't this be:

	compatible = "fsl,mpic-global-timer", "open-pic,global-timer";

> +	device_type = "open-pic";
> +	reg = <0x420f0 4 0x42100 0x100 0x42300 4>;
> 	interrupts = <4 0 3 0
> 		      5 0 3 0
> 		      6 0 3 0
> diff --git a/arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi b/arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi
> index 71c30eb..c71d8e0 100644
> --- a/arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi
> +++ b/arch/powerpc/boot/dts/fsl/pq3-mpic.dtsi
> @@ -44,9 +44,10 @@ mpic: pic@40000 {
> 	last-interrupt-source = <255>;
> };
> 
> -timer@41100 {
> -	compatible = "fsl,mpic-global-timer";
> -	reg = <0x41100 0x100 0x41300 4>;
> +timer@410f0 {
> +	compatible = "fsl,global-timer";

same as above.

> +	device_type = "open-pic";
> +	reg = <0x410f0 4 0x41100 0x100 0x41300 4>;
> 	interrupts = <0 0 3 0
> 		      1 0 3 0
> 		      2 0 3 0
> -- 
> 1.7.5.1
> 
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
