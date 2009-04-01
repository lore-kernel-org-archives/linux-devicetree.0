From: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>
Subject: Re: [PATCH 1/2] powerpc: i2c-mpc: preserve I2C clocking
Date: Wed, 01 Apr 2009 09:40:13 +0200
Message-ID: <49D31A5D.8030204@grandegger.com>
References: <20090331124338.531903515@denx.de>
	<20090331124348.330571158@denx.de>
	<20090331230626.GB23304@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090331230626.GB23304-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

David Gibson wrote:
> On Tue, Mar 31, 2009 at 02:43:39PM +0200, Wolfgang Grandegger wrote:
>> The I2c node property "fsl,preserve-clocking" allows to overtake the
>> clock settings from the boot loader and avoids the hard-coded setting.
> 
> Hrm.  This is dubious.  The device tree should generally describe
> hardware, not OS/driver behaviour which is what this appears to be
> doing.  There are exceptions, but you need to justify them.

I think the purpose of this property is clear. How would you provide
that functionality instead? I suggested that a "clock-frequency = <0>"
property should do the trick but Grant preferred to be more explicit.

Wolfgang.
