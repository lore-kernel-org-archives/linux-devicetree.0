From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] exynos_g2d: Add Bindings for exynos G2D driver
Date: Fri, 08 Feb 2013 23:02:58 +0100
Message-ID: <51157612.2020707@gmail.com>
References: <1357218214-3706-1-git-send-email-ajaykumar.rs@samsung.com>
 <20130208215006.605183E2C27@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130208215006.605183E2C27@localhost>
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
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Ajay Kumar <ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/08/2013 10:50 PM, Grant Likely wrote:
> On Thu, 03 Jan 2013 08:03:34 -0500, Ajay Kumar<ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>  wrote:
>> Add documentation for the DT bindings in exynos G2D driver.
>>
>> Signed-off-by: Ajay Kumar<ajaykumar.rs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>
> Applied, thanks.

Hi Grant,

I believe this patch should not be applied. The compatible property has
changed. Here is relevant patch series for the drivers [1], but I couldn't
find a new version of the documentation patch.

[1] http://www.spinics.net/lists/linux-media/msg59701.html

--

Thanks,
Sylwester
