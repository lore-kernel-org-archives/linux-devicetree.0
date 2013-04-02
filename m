From: "Markus Mayer" <mmayer-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: of_iomap() and devres questions
Date: Tue, 2 Apr 2013 12:25:59 -0700
Message-ID: <515B30C7.6040002@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
List-Id: devicetree@vger.kernel.org

Hi all,

I have a few questions regarding the implementation of the of_iomap() 
function.

As it currently stands, the function parses the device tree for the 
device's address and then simply calls ioremap() with that address and 
the associated size.

The first question that has come up is why of_iomap() doesn't also call 
request_mem_region()? Is there a particular reason for it or has it just 
not yet been implemented?

The second question is regarding the use of devres in of_iomap(). Would 
it make sense for of_iomap() to use devm_ioremap() or, better yet, 
devm_request_and_ioremap() instead of simply calling ioremap()?

Thanks,
-Markus
