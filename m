From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC PATCH 12/14] ARM: vexpress: add board support for DT probing
Date: Wed, 18 Aug 2010 13:56:00 -1000
Message-ID: <4C6C7310.1070103@firmworks.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>	<1282158000-23081-11-git-send-email-lorenzo.pieralisi@arm.com>	<1282158000-23081-12-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-13-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-13-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The sequence "of_get_property() .. of_read_number()" is sufficiently 
common to justify a function like

   error = of_read_numeric_property(node, name, default_value, &value)

Mitch
