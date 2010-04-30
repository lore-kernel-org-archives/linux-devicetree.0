From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: dtc: Extend and better test dtbs_equal utility programs (resend)
Date: Fri, 30 Apr 2010 08:39:05 -0500
Message-ID: <E1O7qQr-0004ZA-Ez@jdl.com>
References: <20100430053000.GV6284@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20100430053000.GV6284@yookeroo> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> The dtbs_equal_ordered test program is used to implement a number of
> testcases.  However, the test program itself has never been
> particularly well tested.  In addition there are testcases coming in
> future for which it would be useful to have a corresponding
> "dtbs_equal_unordered" which checks for equality of device trees, not
> considering the internal ordering of elements.  Finally, for some
> tests we may want it would be useful to check trees for equality with
> the PASS case being when they are *not* equal.
> 
> This patch addresses all of the above.  A dtbs_equal_unordered is
> added, and both it and the existing dtbs_equal_ordered program now
> take a -n option to make the PASS case be where the trees are not
> equal.  A number of example trees with slight modifications from
> test_tree1 are used to verify that both these programs correctly
> identify when the tree is altered, and a dtb_reverse program is used
> to verify that the unordered version does not depend on internal
> ordering.  These new testcases for the equality testing programs are
> split out into a new test group in run_tests.sh.
> 
> dtbs_equal_unordered uses the new property iteration functions, and so
> this also acts as further testing for those functions.
> dtbs_equal_unordered will be useful for further testing the recently
> added tree-merging code and its upcoming extensions.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Applied.

jdl
