From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: TI OMAP device tree and DSPs?
Date: Thu, 8 Dec 2011 15:03:27 -0600
Message-ID: <D7CA9494-73D0-4251-9A3E-F71206263D4A@kernel.crashing.org>
References: <F9C60F6C-BC0A-4987-B59E-DCCBD249424D@kernel.crashing.org>
 <4EE0ECB5.2030407@ti.com>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EE0ECB5.2030407-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: "Cousson, Benoit" <b-cousson-l0cyMroinI0@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org Discuss" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Dec 8, 2011, at 10:58 AM, Cousson, Benoit wrote:

> On 12/8/2011 5:07 PM, Kumar Gala wrote:
>> Seen a lot of ARM&  TI OMAP discussions on this list.  I was
>> wondering if the DSPs on any devices that have ARM + DSP are
>> represented in the device trees yet.
> 
> So far, for the OMAP case, the DSP node is mostly empty.
> 
> The issue is that I'm not sure we can represent in the same DT both MPU and DSP view, since the DT root is supposed to represent a processor.
> If we need the real DSP viewpoint, we will have to mostly duplicate the MPU view then remove MPU private peripherals and add the DSP private peripherals.
> 
> Regards,
> Benoit

Is there pointer to an example dts that show whatever you have for DSP ?

- k
